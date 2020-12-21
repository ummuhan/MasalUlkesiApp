import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/screens/detail_page.dart';
import 'package:storyapp/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Masal Ülkesi',
      theme: ThemeData(
        primaryColor: gradientStartColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MasalListe(),
    );
  }
}