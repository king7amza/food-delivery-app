import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/bottom_navbar.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          titleTextStyle: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: BottomNavbar(),
    ),
  );
}
