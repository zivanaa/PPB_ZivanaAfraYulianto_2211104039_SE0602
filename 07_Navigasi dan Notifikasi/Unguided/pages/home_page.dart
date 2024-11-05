// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../data/product_data.dart'; // Import the product data
import 'promo_detail_page.dart'; // Import the promo detail page

class HomePage extends StatelessWidget {
  final List<String> carouselImages = [
    "https://media.istockphoto.com/id/1201024669/id/foto/pria-tampan-dengan-pakaian-kasual.jpg?s=612x612&w=0&k=20&c=WCcadhGime0gFul6FkMBdykjWT-8BoNiv02VuYEcfUw=",
    "https://media.istockphoto.com/id/660629502/id/foto/satu.jpg?s=2048x2048&w=is&k=20&c=XSn2HIO5CA5-A2PUzkZf6l_VtrNNooUzuxGmEcdBDv0=",
    "https://media.istockphoto.com/id/1447021254/id/foto/model-pria-kulit-hitam-bergaya-di-teluk.jpg?s=2048x2048&w=is&k=20&c=jhbO02FgWz_kUA2QkkmzZkSz-r9CjSP5YhIcvJcfpho=",
  ];

  final List<Map<String, String>> promotions = [
    {
      "title": "50% Off Select Items",
      "description": "Limited time offer on selected products!",
      "buttonText": "Shop Now",
    },
    {
      "title": "Buy One Get One Free",
      "description": "On all T-shirts this weekend!",
      "buttonText": "Grab Yours",
    },
    {
      "title": "Free Shipping on Orders Over \$50",
      "description": "Shop more and save on shipping!",
      "buttonText": "Start Shopping",
    },
    {
      "title": "New Arrivals: 20% Off",
      "description": "Discover our latest collections!",
      "buttonText": "View Now",
    },
  ];

  void _navigateToPromoDetail(
      BuildContext context, String title, String description) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PromoDetailPage(title: title, description: description),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stylish Search Bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Products...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                    border: InputBorder.none, // Remove the default border
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  onChanged: (value) {
                    // You can implement the search logic here
                  },
                ),
              ),
              SizedBox(height: 20),

              // Carousel Slider for Promotional Banners
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                ),
                items: carouselImages.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Welcome Text
              Text(
                "Welcome to Our Store!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Discover our latest products and exclusive deals.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),

              // Horizontal Promo of the Day Section
              Text(
                "Promotions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 150, // Set a fixed height for the promo cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: promotions.length,
                  itemBuilder: (context, index) {
                    final promo = promotions[index];
                    return Container(
                      width: 250, // Set a width for each promo card
                      margin:
                          EdgeInsets.only(right: 10), // Spacing between cards
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.purpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              promo["title"]!,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              promo["description"]!,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                _navigateToPromoDetail(context, promo["title"]!,
                                    promo["description"]!);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(promo["buttonText"]!),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Featured Products Section
              Text(
                "Featured Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount:
                    products.length, // Use products from product_data.dart
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "\$${product.price}",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add to Cart action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text("Add to Cart"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
