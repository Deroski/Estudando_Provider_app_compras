import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/exceptions/http_exception.dart';
import 'package:shop_app_flutter/models/product.dart';
import 'package:shop_app_flutter/utils/app_routes.dart';
import '../models/product_list.dart';

class ProductItem extends StatelessWidget {

  
  final Product product;
  const ProductItem(
    this.product, {
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product.imageUrl,
        ),
      ),
      title: Text(
        product.name,
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon:const Icon(
                Icons.edit,
              ),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.productForm,
                  arguments: product,
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
              ),
              color: Theme.of(context).colorScheme.error,
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text(
                      'Excluir Produto',
                    ),
                    content: const Text(
                      'Tem Certeza?',
                    ),
                    actions: [
                      TextButton(
                        child:const Text(
                          'Não',
                        ),
                        onPressed: () => Navigator.of(ctx).pop(
                          false,
                        ),
                      ),
                      TextButton(
                        child:const Text(
                          'Sim',
                        ),
                        onPressed: () => Navigator.of(ctx).pop(
                          true,
                        ),
                      ),
                    ],
                  ),
                ).then((value) async {
                  if (value ?? false) {
                    try {
                      await Provider.of<ProductList>(
                        context,
                        listen: false,
                      ).removeProduct(product);
                    } on HttpException catch (error) {
                      messages.showSnackBar(
                        SnackBar(
                          content: Text(
                            error.toString(),
                          ),
                        ),
                      );
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
