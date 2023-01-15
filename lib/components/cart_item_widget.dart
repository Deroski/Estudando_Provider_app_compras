import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/models/cart_item.dart';

import '../models/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget(
    this.cartItem, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 20,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: FittedBox(
                child: Text(
                  '${cartItem.price}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          title: Text(
            cartItem.name,
          ),
          subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
          trailing: Text('${cartItem.quantity}X'),
        ),
      ),
    );
  }
}
