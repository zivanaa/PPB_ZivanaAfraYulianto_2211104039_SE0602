import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const WisataBanyumasApp());
}

class WisataBanyumasApp extends StatelessWidget {
  const WisataBanyumasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Banyumas',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF07375F),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF4E9F3D)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WisataListScreen(),
    );
  }
}

class WisataListScreen extends StatelessWidget {
  const WisataListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Wisata Banyumas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://www.shutterstock.com/image-illustration/abstract-white-pattern-waves-texture-260nw-2463089043.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return WisataCard(wisata: wisataList[index]);
              },
              childCount: wisataList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Wisata {
  final String name;
  final String description;
  final String imageUrl;

  Wisata({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

final List<Wisata> wisataList = [
  Wisata(
    name: 'Baturraden',
    description:
        'Kawasan wisata alam pegunungan dengan pemandian air panas, air terjun, dan hutan pinus yang sejuk.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Baturraden_overview_from_ridge%2C_Purwokerto%2C_2015-03-23.jpg/600px-Baturraden_overview_from_ridge%2C_Purwokerto%2C_2015-03-23.jpg',
  ),
  Wisata(
    name: 'Telaga Sunyi',
    description:
        'Danau tersembunyi di tengah hutan dengan air yang jernih, ideal untuk camping dan trekking.',
    imageUrl:
        'https://static.promediateknologi.id/crop/0x538:960x1191/0x0/webp/photo/p2/74/2024/06/30/IMG-20240630-WA0005-1398012367.jpg',
  ),
  Wisata(
    name: 'Curug Cipendok',
    description:
        'Air terjun spektakuler dengan ketinggian 92 meter, dikelilingi hutan tropis yang asri.',
    imageUrl:
        'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/593/2024/07/09/curug_cipendok-1298016609.jpg',
  ),
  Wisata(
    name: 'Small World Purwokerto',
    description:
        'Taman miniatur dengan replika landmark dunia, cocok untuk edukasi dan foto-foto.',
    imageUrl:
        'https://www.lamudi.co.id/journal/wp-content/uploads/2023/04/1-3.jpg',
  ),
  Wisata(
    name: 'Owabong Waterpark',
    description:
        'Taman rekreasi air terbesar di Purbalingga dengan berbagai wahana seru untuk segala usia.',
    imageUrl:
        'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/09/2024/04/09/atraksi-flyboard-di-owabong-purbalingga-2408471420.jpg',
  ),
];

class WisataCard extends StatelessWidget {
  final Wisata wisata;

  const WisataCard({Key? key, required this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Hero(
            tag: wisata.name,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                wisata.imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  wisata.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 30, 33, 81),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  wisata.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WisataDetailScreen(wisata: wisata),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF07375F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Lihat Detail',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WisataDetailScreen extends StatelessWidget {
  final Wisata wisata;

  const WisataDetailScreen({Key? key, required this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.name),
      ),
      body: Column(
        children: [
          Hero(
            tag: wisata.name,
            child: Image.network(
              wisata.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              wisata.description,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
