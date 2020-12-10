import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sqflite/sqflite.dart';
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
  int selectedPage = 0;
  final _pageOptions = [AllTalePage(), MasalListe(), AllTalePage()];
  List<Kategori> tumKategoriler;
  DatabaseHelper databaseHelper;
  @override
  void initState() {
    tumKategoriler = List<Kategori>();
    databaseHelper = DatabaseHelper();
    databaseHelper.kategorileriGetir().then((kategorileriIcerenMapListesi) {
      for (var map in kategorileriIcerenMapListesi) {
        //Çektiğimiz map verileri nesneyye çevirerek listeye attık.
        tumKategoriler.add(Kategori.fromMap(map));
        debugPrint(Kategori.fromMap(map).toString());
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CollapsingNavigationDrawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Masal Ülkesi",
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 9,
                      child: Image.asset("assets/images/unicorn.png"),
                    )
                  ],
                ),
                //   SizedBox(height: 10),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Masal Çeşitleri",
                        style: TextStyle(
                          color: const Color(0x7cdbf1ff),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  ),
                ),
                Container(
                  height: 400,
                  child: Swiper(
                    itemCount: tumKategoriler.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
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
                                height: 50,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          DetailPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                          ),
                                          Text(
                                            tumKategoriler[index].kategoriAdi,
                                            style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 30),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Masal Çeşitleri",
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 20),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
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
                                      MediaQuery.of(context).size.height / 4,
                                  child: Image.asset(
                                      "assets/images/homepage_image/resim" +
                                          index.toString() +
                                          ".png")))
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
