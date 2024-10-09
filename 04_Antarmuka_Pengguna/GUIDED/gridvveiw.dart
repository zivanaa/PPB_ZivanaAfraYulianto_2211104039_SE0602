import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridviewApp(),
    );
  }
}

class GridviewApp extends StatefulWidget {
  const GridviewApp({super.key});

  @override
  State<GridviewApp> createState() => _GridviewAppState();
}

class _GridviewAppState extends State<GridviewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('praktikum 4'),
          backgroundColor: Colors.blueAccent[700],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(12),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('Gridview 1'),
                  Icon(Icons.ac_unit),
                ],
              ),
              color: Colors.amberAccent,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Icon(Icons.add),
                  Text('Gridview 1'),
                ],
              ),
              color: const Color.fromARGB(255, 15, 153, 15),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 1'),
              color: const Color.fromARGB(255, 73, 37, 174),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 1'),
              color: const Color.fromARGB(255, 248, 88, 120),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 1'),
              color: const Color.fromARGB(255, 220, 51, 229),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Gridview 1'),
              color: const Color.fromARGB(255, 6, 6, 6),
            ),
          ],
        ));
  }
}
