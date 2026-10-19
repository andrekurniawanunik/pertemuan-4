import 'package:flutter/material.dart';
import 'package:pml/domain/barang.dart';

class DetailShopingScreen extends StatelessWidget {
  const DetailShopingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final barang = ModalRoute.of(context)!.settings.arguments as Barang;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Shopping"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'barang_${barang.id}', // Tag sama dengan yang ada di ShopingScreen
                    child: Image.network(
                      barang.foto,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported, size: 100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          barang.nama_barang,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Harga: Rp ${barang.harga}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Stok Tersedia: ${barang.stok}'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text('${barang.rating}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer Nama dan NIM
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: const Text(
              'Nama: [Isi Nama Anda] | NIM: [Isi NIM Anda]',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}