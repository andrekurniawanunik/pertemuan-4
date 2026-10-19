import 'package:flutter/material.dart';
import 'package:pml/pages/shoping_screen.dart';
import 'package:pml/pages/detail_shoping.dart';
import 'package:pml/data/barang.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => const ShopingScreen(),
        '/detail': (context) => const DetailShopingScreen(),
      },
    );
  }
}