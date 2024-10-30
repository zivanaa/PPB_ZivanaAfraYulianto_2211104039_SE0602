import 'package:flutter/material.dart';
import 'package:praktikum_2/models/product.dart';
import 'package:praktikum_2/systems/local_notifications.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        backgroundColor: Color(0xFF952491), // Warna header
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(16.0),
              elevation: 4,
              color: Color(0xFF650000), // Background Card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Sudut tumpul
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150, // Sesuaikan tinggi
                          color: Color(0xFFFEF250), // Background untuk gambar
                        ),
                        Image.network(
                          product.gambarUrl,
                          width: 150, // Sesuaikan ukuran
                          height: 150, // Sesuaikan ukuran
                          fit: BoxFit.cover, // Untuk menjaga proporsi gambar
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      product.nama,
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFE6AF2E)), // Teks judul produk
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Rp${product.harga}',
                      style: TextStyle(
                          fontSize: 20, color: Color(0xFFFEF250)), // Teks harga
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.deskripsi,
                        style: TextStyle(
                            color: Color(0xFFE7EB90)), // Teks deskripsi produk
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                LocalNotifications.showSimpleNotification(
                  title: product.nama,
                  body: 'Harga: Rp${product.harga}\n${product.deskripsi}',
                  payload: 'Detail untuk ${product.nama}',
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2274A5), // Background tombol
              ),
              child: Text(
                'Tampilkan Notifikasi',
                style: TextStyle(color: Color(0xFFFADF63)), // Teks pada tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
