import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/components/order_widget.dart';

import '../../components/app_drawer.dart';
import '../order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

 
   /*State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> { */
  /* bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    /* Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders().then((_) { */
    setState(
      () => _isLoading = false,
    );
    //});
  } */

  Future<void> _refreshProductsTwo(BuildContext context) {
    return Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    //final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos:'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        // <= FB é focado em trabalhar com requisições assíncronas(podemos tratar erros nele também)
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.error != null) {
            return const Center(
              child: Text(
                'Ocorreu um erro!',
              ),
            );
          } else {
            return Consumer<OrderList>(
              builder: ((context, orders, child) => ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: ((context, index) => OrderWidget(
                          order: orders.items[index],
                        )),
                  )),
            );
          }
        }),
      ),
      /* body: RefreshIndicator(
        onRefresh: () => _refreshProductsTwo(context),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: orders.itemsCount,
                itemBuilder: (ctx, i) => OrderWidget(
                  order: orders.items[i],
                ),
              ),
      ), */
    );
  }
}
