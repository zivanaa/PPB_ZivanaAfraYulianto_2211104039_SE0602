// lib/pages/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variables for holding user information
  String name = "zivana Afra Y";
  String email = "zivaa@blablabla.com";
  bool isEditing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = name; // Initialize with current name
    _emailController.text = email; // Initialize with current email
  }

  void _saveChanges() {
    setState(() {
      name = _nameController.text;
      email = _emailController.text;
      isEditing = false; // Exit edit mode
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Edit or Save Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing; // Toggle editing mode
                    if (!isEditing) {
                      _saveChanges(); // Save changes if exiting edit mode
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  isEditing ? 'Save' : 'Edit Profile', // Button text
                  style: TextStyle(
                      color: Colors.white, fontSize: 16), // Text color
                ),
              ),
              SizedBox(height: 20),

              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/media/FfNpMfkWAAApJO-?format=jpg&name=small"),
              ),
              SizedBox(height: 20),

              // Editable Name Field
              isEditing
                  ? TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      name,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
              SizedBox(height: 10),

              // Editable Email Field
              isEditing
                  ? TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      email,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),

              SizedBox(height: 20),
              Divider(),

              // Account Options
              ListTile(
                leading: Icon(Icons.history, color: Colors.deepPurple),
                title: Text('Order History'),
                onTap: () {
                  // Navigate to Order History Page
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.deepPurple),
                title: Text('Wish List'),
                onTap: () {
                  // Navigate to Wish List Page
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.deepPurple),
                title: Text('Account Settings'),
                onTap: () {
                  // Navigate to Account Settings Page
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.deepPurple),
                title: Text('Help Center'),
                onTap: () {
                  // Navigate to Help Center Page
                },
              ),
              Divider(),

              // User Reviews Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Your Reviews",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text('Great Product!'),
                subtitle: Text('I loved this product! Highly recommend.'),
                trailing: Icon(Icons.star, color: Colors.amber),
                onTap: () {
                  // View Review Details
                },
              ),
              ListTile(
                title: Text('Average Experience'),
                subtitle: Text('The product was okay, nothing special.'),
                trailing: Icon(Icons.star_half, color: Colors.amber),
                onTap: () {
                  // View Review Details
                },
              ),
              ListTile(
                title: Text('Terrible Quality'),
                subtitle: Text('Did not meet my expectations.'),
                trailing: Icon(Icons.star_border, color: Colors.amber),
                onTap: () {
                  // View Review Details
                },
              ),
              Divider(),

              // Logout Button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle logout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white), // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
