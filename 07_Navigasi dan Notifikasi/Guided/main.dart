import 'package:flutter/material.dart';
import 'package:praktikum_2/pages/mypage.dart';
import 'package:praktikum_2/systems/local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF952491), // Warna utama aplikasi
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF952491)),
        useMaterial3: true,
      ),
      home: MyPage(),
    );
  }
}
