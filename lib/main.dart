import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/models/order_list.dart';
import 'package:shop_app_flutter/models/screens/auth_or_home_screen.dart';
import 'package:shop_app_flutter/models/screens/product_detail_screen.dart';
import 'package:shop_app_flutter/utils/app_routes.dart';
import 'models/auth.dart';
import 'models/cart.dart';
import 'models/product_list.dart';
import 'models/screens/cart_screen.dart';
import 'models/screens/orders_screen.dart';
import 'models/screens/product_form_screen.dart';
import 'models/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(
      fontFamily: 'Lato',
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProxyProvider<Auth, ProductList>(
            create: (_) => ProductList('', []),
            update: (ctx, auth, previous) {
              return ProductList(auth.token ?? '', previous?.items ?? []);
            }),
        ChangeNotifierProvider(
          create: (_) => Auth(),
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
        theme: tema.copyWith(
          textTheme:
              const TextTheme(titleLarge: TextStyle(color: Colors.white)),
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.black,
            secondary: Colors.deepOrange,
          ),
        ),
        //home: ProductsOverviewScreen(),
        routes: {
          AppRoutes.authOrHome: (ctx) => const AuthOrHomeScreen(),
          AppRoutes.productDetail: (ctx) => const ProductDetailScreen(),
          AppRoutes.cart: (ctx) => const CartScreen(),
          AppRoutes.orders: (ctx) => const OrdersScreen(),
          AppRoutes.products: (ctx) => const ProductsScreen(),
          AppRoutes.productForm: (ctx) => const ProductFormScreen(),
        },
      ),
    );
  }
}
