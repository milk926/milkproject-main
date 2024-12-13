import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:milkproject/farmer/page/dailymilk-quandity.dart';
import 'package:milkproject/farmer/page/dung-cake.dart';
import 'package:milkproject/farmer/page/farmer_home_page.dart';
import 'package:milkproject/firebase_options.dart';
import 'package:milkproject/society/page/homepage.dart';
import 'package:milkproject/society/page/profilepage.dart';
import 'package:milkproject/user/page/buy_now.dart';
import 'package:milkproject/user/page/edit_profile.dart';
import 'package:milkproject/user/page/login_page.dart';
import 'package:milkproject/user/page/services/addtocart.dart';
import 'package:milkproject/user/page/user_buynow.dart';
import 'package:milkproject/user/page/userprofile.dart';

import 'farmer/page/farmer_profile_page.dart';
import 'farmer/page/farmer_registration_page.dart'; // Assuming ProfileScreen is in this file

// Define a simple User class if not already defined
class User {
  String name;
  String email;
  String phone;
  int cows;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.cows});
}

// Main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FarmerRegistrationScreen(), // Pass the test user to the ProfileScreen
    ),
  );
}
