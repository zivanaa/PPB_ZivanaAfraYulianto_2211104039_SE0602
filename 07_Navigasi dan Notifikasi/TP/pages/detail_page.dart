import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  DetailPage({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display Main Image
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Description
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Additional Information Section
                  Text(
                    'Explore this Beautiful Location!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover the breathtaking landscapes, vibrant culture, and serene ambiance of $name. Ideal for those seeking relaxation and adventure.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Map Placeholder
                  Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        'Map of $name (Placeholder)',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.location_on),
                        label: Text('Get Directions'),
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          // Add functionality for directions
                        },
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.phone),
                        label: Text('Contact Us'),
                        style: ElevatedButton.styleFrom(
                          
                        ),
                        onPressed: () {
                          // Add functionality for contact
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
