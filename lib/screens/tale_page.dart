import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/Style/text_style.dart';

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
        backgroundColor: category0,
        body: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 10, right: MediaQuery.of(context).size.width / 1.2),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 8,
                child: Image.asset(
                  "assets/images/lion.png",
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
              Container(
                  margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      IconButton(icon: Icon(Icons.share), onPressed: () {}),
                      IconButton(icon: Icon(Icons.comment), onPressed: () {})
                    ],
                  ))
            ],
          ),
        ));
  }
}
