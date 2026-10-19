import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'domain/barang.dart';
import 'pages/shoping_screen.dart';
import 'pages/detail_shoping.dart';

// Konfigurasi GoRouter
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ShopingScreen(),
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            // Mengambil data objek barang dari parameter extra
            final barang = state.extra as Barang;
            return DetailShopingScreen(barang: barang);
          },
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan MaterialApp.router untuk mendukung GoRouter
    return MaterialApp.router(
      title: 'Aplikasi Daftar Belanja',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green, // Silakan ganti warna sesuai keinginan
        useMaterial3: true,
      ),
    );
  }
}