import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/components/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(215, 117, 255, 0.5),
                    Color.fromRGBO(255, 188, 117, 0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 25,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      transform: Matrix4.rotationZ(-8 * pi / 180)
                        ..translate(-10.0), //cascade .. funciona com double
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange.shade900,
                          boxShadow: [
                             const BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0, 4),
                            )
                          ]),
                      child: Text(
                        'Minha Loja',
                        style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Anton',
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                      ),
                    ),
                    const AuthForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Exemplo usado para explicar o cascade operator

/* void main() {
  List<int> a = [1, 2, 3];
  a.add(4);
  a.add(5);
  a.add(6);

  //cascade
  a
    ..add(7)
    ..add(8)
    ..add(9);
  print(a);
} */
