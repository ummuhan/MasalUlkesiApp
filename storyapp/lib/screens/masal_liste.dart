import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/screens/detail_page.dart';
import 'package:storyapp/utils/database_helper.dart';

class MasalListe extends StatefulWidget {
  MasalListe({Key key}) : super(key: key);

  @override
  _MasalListeState createState() => _MasalListeState();
}

class _MasalListeState extends State<MasalListe> {
  @override
  Widget build(BuildContext context) {
    var databaseHelper = DatabaseHelper();
    databaseHelper.kategorileriGetir();

    return Scaffold(
      backgroundColor: gradientEndColor,
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
                Text(
                  "Masal Ülkesi",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 38,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.left,
                ),
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
                    itemCount: 5,
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
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
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
                                          "Hayvan Masalları",
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 30),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 20,
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
                              )
                            ],
                          ),
                          Container(
                              //   width: 180,
                              child: Image.asset("assets/images/lionk.png"))
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        //height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/images/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/images/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
