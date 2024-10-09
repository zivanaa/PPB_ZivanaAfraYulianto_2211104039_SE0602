import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ListViewApp(),
    );
  }
}

class ListViewApp extends StatefulWidget {
  const ListViewApp({super.key});

  @override
  State<ListViewApp> createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan ListView'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 167, 51, 43),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 15, 42, 140),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 120, 11, 139),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 12, 209, 84),
            child: Center(
              child: Text(("Type A")),
            ),
          ),
        ],
      ),
    );
  }
}
