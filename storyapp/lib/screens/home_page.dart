import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:storyapp/screens/story_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            right: 5,
            left: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.book,
                size: 30,
                color: Colors.green[900],
              ),
              Container(
                child: Center(
                  child: GradientText("Masal Ülkesi",
                      gradient: LinearGradient(colors: [
                        Colors.deepPurple,
                        Colors.green,
                        Colors.red
                      ]),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.blue,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Masal Seçenekleri",
            style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.w600),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MasalCesitEkle(
                secenekIsim: "Kısa Masallar",
                arkaPlanResmi: "assets/images/village.jpg",
              ),
              MasalCesitEkle(
                secenekIsim: "İngilizce Masallar",
                arkaPlanResmi: "assets/images/image.jpg",
              ),
              MasalCesitEkle(
                secenekIsim: "Gerçek Öyküler",
                arkaPlanResmi: "assets/images/ornek.jpg",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "En Çok Sevilenler",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StoryPage(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 10, top: 10, right: 10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/lion.jpg",
                  ),
                  radius: 70,
                )),
                Text(
                  "Adaletli Paylaşım",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.purple[900],
                    ),
                    Text("1983"),
                  ],
                )
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
          ),
        ),
      ],
    ));
  }
}

class MasalCesitEkle extends StatelessWidget {
  final String secenekIsim;
  final String arkaPlanResmi;

  const MasalCesitEkle({
    Key key,
    this.secenekIsim,
    this.arkaPlanResmi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 5, left: 20, bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(
              arkaPlanResmi,
            ),
            fit: BoxFit.cover),
      ),
      child: Text(
        secenekIsim,
        style: TextStyle(fontSize: 20),
      ),
      width: MediaQuery.of(context).size.width / 1.3,
      height: MediaQuery.of(context).size.height / 3,
    );
  }
}
