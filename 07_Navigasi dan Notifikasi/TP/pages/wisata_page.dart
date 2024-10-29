import 'package:flutter/material.dart';
import 'detail_page.dart';

class WisataPage extends StatelessWidget {
  final List<Map<String, String>> wisataList = [
    {
      'name': 'Pantai Kuta',
      'description':
          'Pantai yang indah dengan pasir putih dan pemandangan matahari terbenam yang menawan.',
      'image':
          'https://www.water-sport-bali.com/wp-content/uploads/2015/02/Pantai-Nusa-Dua-Bali-1.jpg'
    },
    {
      'name': 'Gunung Bromo',
      'description':
          'Gunung berapi aktif yang terkenal, dengan pemandangan sunrise yang memukau.',
      'image':
          'https://i0.wp.com/jnewsonline.com/wp-content/uploads/2023/05/gunung-bromo.jpg?w=1000&ssl=1'
    },
    {
      'name': 'Danau Toba',
      'description':
          'Danau vulkanik terbesar di dunia, dikelilingi oleh pemandangan alam yang indah.',
      'image':
          'https://torch.id/cdn/shop/articles/Artikel_170_-_Preview.jpg?v=1713641039'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wisataList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  name: wisataList[index]['name']!,
                  description: wisataList[index]['description']!,
                  imageUrl: wisataList[index]['image']!,
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                // Background Image with Rounded Corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    wisataList[index]['image']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradient Overlay for Text Readability
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                // Title and Description
                Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisataList[index]['name']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        wisataList[index]['description']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
