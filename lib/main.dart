import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/models/cart.dart';
import 'package:shop_app_flutter/models/order_list.dart';
import 'package:shop_app_flutter/models/product_list.dart';
import 'package:shop_app_flutter/models/screens/cart_screen.dart';
import 'package:shop_app_flutter/models/screens/product_detail_screen.dart';
import 'package:shop_app_flutter/models/screens/products_overview_screen.dart';
import 'package:shop_app_flutter/utils/app_routes.dart';
import 'models/screens/orders_screen.dart';
import 'models/screens/product_form_screen.dart';
import 'models/screens/products_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen)
              .copyWith(secondary: Colors.yellowAccent),
          fontFamily: 'Lato',
        ),
        //home: ProductsOverviewScreen(),
        routes: {
          AppRoutes.HOME: (context) => ProductsOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailScreen(),
          AppRoutes.CART: (context) => CartScreen(),
          AppRoutes.ORDERS: (context) => OrdersScreen(),
          AppRoutes.PRODUCTS: (context) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormScreen(),
        },
      ),
    );
  }
}
