// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/pages/intro_page.dart';
import 'package:shopping_cart/pages/shop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
         home: const IntroPage(),
      ),
    );
  }
}