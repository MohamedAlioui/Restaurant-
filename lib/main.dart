import 'package:flutter/material.dart';

void main() {
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OUR RESTAURANT ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // App bar with white background
        elevation: 0, // Remove shadow under AppBar
        iconTheme: IconThemeData(color: Colors.black), // Icon color in AppBar
      ),
      body: Container(
        color: Colors.white, // Set main background to white
        child: Column(
          children: [
            // Header Section
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://source.unsplash.com/1600x900/?restaurant,food'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Welcome Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome to OUR RESTAURANT!',
                style: TextStyle(
                  fontSize:24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Dark text color for contrast
                ),
              ),
            ),
            SizedBox(height: 10),
            // Description Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Experience fine dining with our exquisite selection of dishes, crafted from the freshest ingredients. Savor every bite!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // Lighter color for descriptive text
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            // Food Categories Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Food Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Dark color for the section title
                ),
              ),
            ),
            // Categories Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                children: [
                  CategoryCard('Pizza', 'assets/images/1200.jpg', Colors.red.shade50),
                  // Swap images as before
                  CategoryCard('Sandwich', 'assets/images/3215.jpg', Colors.yellow.shade50),
                  CategoryCard('Hamburger', 'assets/images/24534.jpg', Colors.brown.shade50),
                  CategoryCard('Salad', 'assets/images/2148515515.jpg', Colors.green.shade50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color backgroundColor;

  CategoryCard(this.title, this.imageUrl, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor, // Soft background colors for the cards
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Dark text for card titles
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
