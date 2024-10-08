import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const WisataApp());
}

class WisataApp extends StatelessWidget {
  const WisataApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color.fromARGB(255, 7, 55, 95),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WisataScreen(),
    );
  }
}

class WisataScreen extends StatefulWidget {
  const WisataScreen({Key? key}) : super(key: key);

  @override
  _WisataScreenState createState() => _WisataScreenState();
}

class _WisataScreenState extends State<WisataScreen>
    with SingleTickerProviderStateMixin {
  final String tempatWisata = "Pantai Kuta";
  final String deskripsi =
      "Pantai Kuta adalah destinasi wisata terkenal di Bali, Indonesia, yang populer di kalangan wisatawan lokal dan mancanegara. Pantai ini memiliki hamparan pasir putih yang luas, air laut yang jernih, dan ombak yang sempurna untuk berselancar, terutama bagi pemula. Keindahan Pantai Kuta tak hanya terletak pada pesona alamnya, tetapi juga suasana hidup yang selalu ramai, mulai dari pagi hingga malam hari. Setiap sore, wisatawan berkumpul untuk menikmati pemandangan matahari terbenam yang memukau, saat langit berubah menjadi nuansa jingga dan merah."
      "\n\nSelain itu, Pantai Kuta menawarkan berbagai fasilitas pendukung seperti bar dan kafe tepi pantai, tempat penyewaan papan selancar, dan area berjemur yang nyaman. Di sekelilingnya, Anda bisa menemukan banyak hotel, restoran, dan pusat perbelanjaan, menjadikannya tempat yang ideal untuk berbagai aktivitas wisata. Dengan sejarah sebagai desa nelayan kecil yang kini menjadi pusat wisata internasional, Pantai Kuta tetap mempertahankan pesonanya yang alami meski dikelilingi perkembangan modern."
      "\n\nPantai ini menjadi simbol pariwisata Bali, menyuguhkan pengalaman beragam bagi wisatawan yang mencari petualangan, relaksasi, atau sekadar menikmati pemandangan alam yang luar biasa. Keindahan Pantai Kuta dan berbagai fasilitas modernnya menjadikannya destinasi wajib bagi siapa pun yang berkunjung ke Bali.";

  final String imageUrl =
      'https://www.water-sport-bali.com/wp-content/uploads/2015/02/Pantai-Nusa-Dua-Bali-1.jpg';

  late AnimationController _controller;
  late Animation<double> _animation;
  late ScrollController _scrollController;
  double _appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarOpacity = _scrollController.offset / 300.0;
          if (_appBarOpacity > 1.0) _appBarOpacity = 1.0;
          if (_appBarOpacity < 0.0) _appBarOpacity = 0.0;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 7, 55, 95).withOpacity(_appBarOpacity),
        elevation: _appBarOpacity * 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Rekomendasi Wisata',
          style: TextStyle(
            color: Colors.white.withOpacity(_appBarOpacity),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'wisataImage',
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FadeTransition(
                        opacity: _animation,
                        child: Text(
                          tempatWisata,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black54,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 7, 55, 95),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    deskripsi,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Mengunjungi $tempatWisata"),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 7, 55, 95),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Kunjungi Tempat',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
