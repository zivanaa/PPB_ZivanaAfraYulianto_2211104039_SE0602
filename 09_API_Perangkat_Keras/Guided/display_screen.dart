import 'dart:io';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Picture'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[600],
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
