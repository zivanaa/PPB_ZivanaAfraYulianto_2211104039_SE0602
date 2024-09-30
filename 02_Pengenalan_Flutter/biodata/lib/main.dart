import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengenalan Diri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 73, 110, 140),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Pengenalan Diri',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 101, 64),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const InfoCard(title: 'Nama', content: 'Zivana Afra Yulianto'),
            const PhotoWidget(),
            const InfoCard(title: 'NIM', content: '2211104039'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(child: InfoBox(content: 'Umur: 21 th')),
                SizedBox(width: 20),
                Flexible(child: InfoBox(content: 'Gol. Darah: B')),
              ],
            ),
            const SizedBox(height: 10),
            const InfoCard(title: 'Hobby', content: ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(child: HobbyBox(hobby: 'Sleep')),
                SizedBox(width: 10),
                Flexible(child: HobbyBox(hobby: 'Scroll')),
                SizedBox(width: 10),
                Flexible(child: HobbyBox(hobby: 'Pet Carl')),
              ],
            ),
            const SizedBox(height: 20),
            const InfoCard(title: 'Alamat', content: 'Shappire Madina Blok H6'),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 101, 64),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$title : $content',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String content;

  const InfoBox({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green,
          width: 4.0,
        ),
      ),
      child: Center(
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}

class HobbyBox extends StatelessWidget {
  final String hobby;

  const HobbyBox({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.green,
          width: 4.0,
        ),
      ),
      constraints: const BoxConstraints(maxWidth: 150),
      child: Center(
        child: Text(
          hobby,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      child: ClipOval(
        child: Image.asset(
          '../assets/photo.jpg',
          width: size.width * 1,
          height: size.width * 1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
