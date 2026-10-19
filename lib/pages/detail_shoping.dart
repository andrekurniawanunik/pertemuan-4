import 'package:flutter/material.dart';
import 'package:pml/domain/barang.dart';

class DetailShopingScreen extends StatelessWidget {
  const DetailShopingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima objek Barang yang dikirim langsung dari ShopingScreen
    final barang = ModalRoute.of(context)!.settings.arguments as Barang;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Shopping"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          barang.nama_barang,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}