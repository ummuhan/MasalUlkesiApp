import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/model/bgcolor_model.dart';
import 'package:storyapp/model/masal.dart';

class DetailPage extends StatefulWidget {
  int index;
  String name;
  String image;
  DetailPage({this.index, this.name, this.image});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Masal> masalList = List<Masal>();
  final String localJsonPath = 'assets/masal.json';

  Future<void> loadLocalJson() async {
    var masalData = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(masalData);
    masalList = decodedJson.map((user) => Masal.fromMap(user)).toList();
    setState(() {
      return masalList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocalJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          bgColorItem[widget.index].color1,
          bgColorItem[widget.index].color2
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 30,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Masal Ülkesi",
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Column(
                    children: [
                      buildMasalContainer(context),
                    ],
                  ),
                ],
              ),
              Positioned(
                child: Hero(
                    tag: "",
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Image.asset("${widget.image}")),
                    )),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Container buildMasalContainer(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.white60,
            borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Image.asset(
                  "assets/images/village.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                  child: Text(
                "Şakın Sincap",
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 30,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              )),
              flex: 4,
            )
          ],
        ));
  }
}
