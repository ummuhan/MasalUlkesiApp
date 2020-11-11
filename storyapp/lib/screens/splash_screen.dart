import 'dart:async';

import 'package:flutter/material.dart';
import 'package:storyapp/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      //Navigator push replacement sayesinde önceki sayfaya dönme işlemi ortadan kalkar.
      Navigator.pushReplacement(
          //Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()));
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //  width: MediaQuery.of(context).size.width / 2,

            height: MediaQuery.of(context).size.height / 2,

            child: Image.asset("assets/images/deneme.png"),
          ),
          Text(
            "Masal Ülkesi",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}