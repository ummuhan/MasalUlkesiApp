import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/model/masal.dart';
import 'package:storyapp/utils/database_helper.dart';

class AllTalePage extends StatefulWidget {
  const AllTalePage({Key key}) : super(key: key);

  @override
  _AllTalePageState createState() => _AllTalePageState();
}

class _AllTalePageState extends State<AllTalePage> {
  bool geldiMi = false; //Verilerin tam olarak gelip gelmedğini kontrol eder.
  List<Masal> tumMasallar;
  DatabaseHelper databaseHelper;
  @override
  void initState() {
    databaseHelper = DatabaseHelper();
    databaseHelper.tumMallariGetir().then((masallariIcerenMapListesi) {
      for (var map in masallariIcerenMapListesi) {
        //Çektiğimiz map verileri nesneyye çevirerek listeye attık.
        tumMasallar.add(Masal.fromMap(map));
        debugPrint(Masal.fromMap(map).toString());
      }
      geldiMi = true;
      setState(() {});
    });
    super.initState();
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
                    geldiMi
                        ? ListView.builder(
                            itemCount: tumMasallar.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('${tumMasallar[index]}'),
                              );
                            })
                        : CircularProgressIndicator(),
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
