import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  final List<Map<String, String>> popularDestinations = [
    {
      'name': 'Pantai Kuta',
      'description':
          'Pantai dengan pasir putih dan matahari terbenam yang indah.',
      'image':
          'https://www.water-sport-bali.com/wp-content/uploads/2015/02/Pantai-Nusa-Dua-Bali-1.jpg'
    },
    {
      'name': 'Gunung Bromo',
      'description':
          'Gunung berapi terkenal dengan pemandangan sunrise yang memukau.',
      'image':
          'https://i0.wp.com/jnewsonline.com/wp-content/uploads/2023/05/gunung-bromo.jpg?w=1000&ssl=1'
    },
    {
      'name': 'Danau Toba',
      'description':
          'Danau vulkanik terbesar di dunia dengan pemandangan alam yang indah.',
      'image':
          'https://torch.id/cdn/shop/articles/Artikel_170_-_Preview.jpg?v=1713641039'
    },
  ];

  void _showWelcomeMessage(BuildContext context) {
    if (nameController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selamat Datang, ${nameController.text}!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Carousel
            CarouselSlider(
              items: popularDestinations.map((destination) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        destination['image']!,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          destination['name']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            backgroundColor: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(height: 20),
            // Welcome Message
            Text(
              'Selamat Datang di Aplikasi Wisata!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // User Input
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Masukan Nama Wisata',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showWelcomeMessage(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: Text('Cari tempat'),
            ),
            SizedBox(height: 20),
            // Greeting Card with User's Name
            if (nameController.text.isNotEmpty)
              Card(
                color: Colors.pink[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Halo, ${nameController.text}!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Temukan destinasi wisata yang cocok untuk Anda!',
                        style: TextStyle(fontSize: 16, color: Colors.pink),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20),
            // Popular Destinations List
            Text(
              'Destinasi Populer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularDestinations.length,
              itemBuilder: (context, index) {
                final destination = popularDestinations[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        destination['image']!,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    title: Text(destination['name']!),
                    subtitle: Text(destination['description']!),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Explore Button
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Mengeksplorasi destinasi wisata...')),
                );
              },
              icon: Icon(Icons.explore),
              label: Text('Eksplorasi Sekarang'),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
