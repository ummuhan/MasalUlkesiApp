import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/Style/text_style.dart';
import 'package:storyapp/model/masal.dart';
import 'package:storyapp/widgets/list_widgets.dart';

class AllTalePage extends StatefulWidget {
  const AllTalePage({Key key}) : super(key: key);

  @override
  _AllTalePageState createState() => _AllTalePageState();
}

class _AllTalePageState extends State<AllTalePage> {
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
                    style: allTalePageTittleStyle,
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    color: Colors.black38,
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
              buildIconButton(context),
            ],
          ),
          masalList.length == 0
              ? const Center(child: const Text("Loading..."))
              : ListView.builder(
                  shrinkWrap: true, //Listview hatasını çözen yapılar
                  physics: ScrollPhysics(),
                  itemCount: masalList.length,
                  itemBuilder: (context, index) {
                    return ListWidget(
                      masalAdi: masalList[index].masalAdi,
                      masalKategori: masalList[index].kategoriID,
                    );
                  }),
        ],
      ),
    );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
