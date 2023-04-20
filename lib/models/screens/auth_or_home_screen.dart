import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/models/screens/auth_screen.dart';
import 'package:shop_app_flutter/models/screens/products_overview_screen.dart';
import '../auth.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? const ProductsOverviewScreen() : const AuthScreen();
  }
}
