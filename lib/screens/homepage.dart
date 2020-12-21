import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/Commons/collapsing_navigation_drawer.dart';
import 'package:storyapp/model/kategori.dart';
import 'package:storyapp/screens/all_tale_page.dart';
import 'package:storyapp/screens/detail_page.dart';
import 'package:storyapp/utils/database_helper.dart';

class MasalListe extends StatefulWidget {
  MasalListe({Key key}) : super(key: key);

  @override
  _MasalListeState createState() => _MasalListeState();
}

class _MasalListeState extends State<MasalListe> {
  bool geldiMi = false;

  final _pageOptions = [AllTalePage(), MasalListe(), AllTalePage()];
  List<Kategori> kategoriList = List<Kategori>();
  final String localJsonPath = 'assets/kategori.json';

  Future<void> loadLocalJson() async {
    var kategoriData = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(kategoriData);
    kategoriList = decodedJson.map((user) => Kategori.fromMap(user)).toList();
    setState(() {
      return kategoriList;
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
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [gradientStartColor, gradientEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 32,
                  left: 32,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Text(
                              "Masal Ülkesi",
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.right,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 9,
                              child: Image.asset("assets/images/unicorn.png"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/20),
                      kategoriList.length == 0
                          ? const Center(child: const Text("Loading..."))
                          : Container(
                              margin: EdgeInsets.only(left: 50),
                              height: 400,
                              child: Swiper(
                                itemCount: kategoriList.length,
                                itemWidth:
                                    MediaQuery.of(context).size.width - 2 * 64,
                                layout: SwiperLayout.STACK,
                                pagination: SwiperPagination(
                                    builder: DotSwiperPaginationBuilder(
                                        activeSize: 20, space: 8)),
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 70,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder:
                                                      (context, a, b) =>
                                                          DetailPage(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.5,
                                              child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(32.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                      ),
                                                      Text(
                                                        kategoriList[index]
                                                            .kategoriAdi, //TODO KATEGORİ İSİM
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Avenir',
                                                            fontSize: 30),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Masal Çeşitleri",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Avenir',
                                                                fontSize: 20),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            size: 15,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(

                                          //   width: 180,

                                          child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        child: Image.asset(
                                            "assets/images/kategori/" +
                                                kategoriList[index]
                                                    .kategoriResim +
                                                ".png"),
                                      ))
                                    ],
                                  );
                                },
                              ),
                            )
                    ]),
              ),
            ),
          ),
          CollapsingNavigationDrawer(),
        ],
      ),
    );
  }
}
