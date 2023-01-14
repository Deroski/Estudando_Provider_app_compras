import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/models/product_list.dart';
import 'package:shop_app_flutter/models/screens/product_detail_screen.dart';
import 'package:shop_app_flutter/models/screens/products_overview_screen.dart';
import 'package:shop_app_flutter/provider/counter.dart';
import 'package:shop_app_flutter/utils/app_routes.dart';

import 'models/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen)
              .copyWith(secondary: Colors.yellowAccent),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
