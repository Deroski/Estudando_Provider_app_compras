import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/models/order_list.dart';
import 'package:shop_app_flutter/models/screens/auth_screen.dart';
import 'package:shop_app_flutter/models/screens/product_detail_screen.dart';
import 'package:shop_app_flutter/models/screens/products_overview_screen.dart';
import 'package:shop_app_flutter/utils/app_routes.dart';
import 'models/auth.dart';
import 'models/cart.dart';
import 'models/product_list.dart';
import 'models/screens/cart_screen.dart';
import 'models/screens/orders_screen.dart';
import 'models/screens/product_form_screen.dart';
import 'models/screens/products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(
      fontFamily: 'Lato',
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => new OrderList(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: tema.copyWith(
          textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.black,
            secondary: Colors.deepOrange,
          ),
        ),
        //home: ProductsOverviewScreen(),
        routes: {
          AppRoutes.AUTH: (ctx) => AuthScreen(),
          AppRoutes.HOME: (ctx) => ProductsOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrdersScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}
