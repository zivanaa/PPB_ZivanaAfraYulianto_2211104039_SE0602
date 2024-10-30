import 'package:flutter/material.dart';
import 'package:praktikum_2/models/product.dart';
import 'package:praktikum_2/pages/detailpage.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        nama: 'Mouse Gaming',
        harga: 300000.00,
        gambarUrl:
            'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
        deskripsi: 'Mouse gaming kualitas lumayan'),
    Product(
        id: 2,
        nama: 'Keyboard Kantor',
        harga: 150000.00,
        gambarUrl:
            'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot%27',
        deskripsi: 'Untuk kebutuhan profesional dengan harga terjangkau'),
    Product(
        id: 3,
        nama: 'Headset Gaming',
        harga: 249000.00,
        gambarUrl:
            'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
        deskripsi: 'Sensasi nyaman dengan suara jernih'),
    Product(
        id: 4,
        nama: 'Flashdisk 64GB',
        harga: 140000.00,
        gambarUrl:
            'https://www.bhphotovideo.com/cdn-cgi/image/fit=scale-down,width=500,quality=95/https://www.bhphotovideo.com/images/images500x500/sandisk_sdcz73_064g_a46_64gb_ultra_flair_usb_1448799616_1203371.jpg',
        deskripsi: 'Penyimpanan besar dengan harga terjangkau'),
    Product(
        id: 5,
        nama: 'TWS M10',
        harga: 45000.00,
        gambarUrl:
            'https://res.cloudinary.com/pusatroxymas/image/upload/w_1024/v1696922978/prod_mproducts/chxx390574_/2023/fpb_231010_ba4d08af-06a4-435c-ae1b-d0f58089857f.jpg.jpg',
        deskripsi: 'Hf tws M10 bluetooth'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Model'),
        centerTitle: true,
        backgroundColor: Color(0xFF952491), // Warna header
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin:
                EdgeInsets.symmetric(vertical: 5.0), // Margin antar ListTile
            child: ListTile(
              tileColor: Color(0xFF632B30),
              leading: Container(
                color: Color(0xFFFEF250), // Background foto produk
                child: Image.network(
                  product.gambarUrl,
                  width: 70,
                  height: 70,
                ),
              ),
              title: Text(
                product.nama,
                style: TextStyle(color: Color(0xFFE6AF2E)), // Teks judul produk
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rp${product.harga}',
                    style: TextStyle(color: Color(0xFFFEF250)), // Teks harga
                  ),
                  Text(
                    product.deskripsi,
                    style: TextStyle(
                        color: Color(0xFFE7EB90)), // Teks deskripsi produk
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
