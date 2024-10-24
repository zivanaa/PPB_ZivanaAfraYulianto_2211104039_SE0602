import 'package:flutter/material.dart';

class WisataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.explore_outlined, size: 100, color: Colors.pink),
          SizedBox(height: 20),
          Text(
            'Temukan Destinasi Wisata!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.pink.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              labelText: 'Destinasi Wisata Favorit',
              prefixIcon: Icon(Icons.place),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.pink,
            ),
            child: Text('Cari Wisata'),
          ),
        ],
      ),
    );
  }
}
