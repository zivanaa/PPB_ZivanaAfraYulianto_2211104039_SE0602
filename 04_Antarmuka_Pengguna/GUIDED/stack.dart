import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StackApp(),
    );
  }
}

class StackApp extends StatefulWidget {
  const StackApp({super.key});

  @override
  State<StackApp> createState() => _StackAppState();
}

class _StackAppState extends State<StackApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Stack'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                color: const Color.fromARGB(255, 39, 61, 79),
                height: 100,
                width: 100,
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: const Color.fromARGB(255, 22, 162, 85),
                height: 100,
                width: 100,
              ),
              Container(
                margin: EdgeInsets.all(20),
                color: const Color.fromARGB(255, 175, 32, 168),
                height: 100,
                width: 100,
              ),
            ],
          ),
          SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.white,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0),
                        Colors.black12,
                        Colors.black45
                      ],
                    ),
                  ),
                  child: const Text(
                    'Foreground Text',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
