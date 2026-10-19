import 'package:flutter/material.dart';
import '../domain/barang.dart';

class DetailShopingScreen extends StatelessWidget {
  final Barang barang;

  const DetailShopingScreen({super.key, required this.barang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(barang.nama_barang),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: 'barang_${barang.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          barang.foto,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image, size: 100);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    barang.nama_barang,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${barang.harga}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Chip(
                        avatar: const Icon(Icons.inventory_2, size: 18),
                        label: Text('Stok: ${barang.stok}'),
                      ),
                      const SizedBox(width: 10),
                      Chip(
                        avatar:
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                        label: Text('Rating: ${barang.rating}'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Footer Identitas
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.green[100],
            child: const Text(
              'Nama: Andre Kurniawan | NIM: [Isi NIM Anda]',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}