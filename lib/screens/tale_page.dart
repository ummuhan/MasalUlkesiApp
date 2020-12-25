import 'dart:math';

import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/Style/text_style.dart';
import 'package:storyapp/model/bgcolor_model.dart';

class TalePage extends StatefulWidget {
  final String masalAdi;
  final int masalKategori;
  final String masalImage;
  final String masalMetin;
  TalePage(
      {Key key,
      this.masalAdi,
      this.masalKategori,
      this.masalImage,
      this.masalMetin})
      : super(key: key);

  @override
  _TalePageState createState() => _TalePageState();
}

class _TalePageState extends State<TalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: [
  Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border()),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    
                      // margin: EdgeInsets.only(right: 20, bottom: 20),
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      IconButton(
                          icon: Image.asset("assets/images/icon/heart.png"),
                          onPressed: () {}),
                      IconButton(
                          icon: Image.asset(
                              "assets/images/icon/speech_bubble.png"),
                          onPressed: () {}),
                      IconButton(
                          icon: Image.asset("assets/images/icon/share.png"),
                          onPressed: () {})
                    ],
                  )),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 8,
                    child: Image.asset(
                      "assets/images/lion.png",
                    ),
                  ),
                  Container(
                    child: Text(
                      "${widget.masalAdi}",
                      style: talePageTittleTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Container(
                    child: Text(
                      "${widget.masalMetin} ",
                      style: talePageTextStyle,
                    ),
                  )
                ],
              ),
            ),
          
        ],
      ),
    ));
  }
}
