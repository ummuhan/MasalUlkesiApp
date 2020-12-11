import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';

class AllTalePage extends StatelessWidget {
  const AllTalePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[300],
        body: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    Text(
                      "Tüm Masallar",
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
                            height: MediaQuery.of(context).size.height / 4,
                            child: Image.asset("assets/images/unicorn.png")),
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
        ));
  }
}

Container buildMasalContainer(BuildContext context) {
  return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
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
