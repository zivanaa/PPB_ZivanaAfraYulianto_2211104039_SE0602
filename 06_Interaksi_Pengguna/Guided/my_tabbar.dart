import 'package:flutter/material.dart';

class MyTabbar extends StatelessWidget {
  const MyTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Menu Tab Bar"),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.food_bank),
                text: "Menu",
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                text: "Kalender",
              ),
              Tab(
                icon: Icon(Icons.history),
                text: "History",
              ),
            ]),
            backgroundColor: const Color.fromARGB(255, 220, 3, 244),
          ),
          body: const TabBarView(children: [
            Center(child: Text("ini konten menu")),
            Center(child: Text("ini konten Calender")),
            Center(child: Text("ini konten history")),
          ]),
        ));
  }
}
