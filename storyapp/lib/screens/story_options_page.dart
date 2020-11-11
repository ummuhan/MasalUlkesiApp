import 'package:flutter/material.dart';
import 'package:storyapp/screens/story_page.dart';

class StoryOptionPage extends StatefulWidget {
  StoryOptionPage({Key key}) : super(key: key);

  @override
  _StoryOptionPageState createState() => _StoryOptionPageState();
}

class _StoryOptionPageState extends State<StoryOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    )),
                Text(
                  "Kısa Masallar",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.w500),
                ),
                Icon(Icons.search)
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
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
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
      ),
    );
  }
}
