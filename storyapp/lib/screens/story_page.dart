import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  StoryPage({Key key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
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
                  "Adaletli Paylaşım",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontWeight: FontWeight.w500),
                ),
                Icon(Icons.favorite),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              "assets/images/lion.jpg",
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Bir yokmuş, bir varmış. Azdan çoktan sana bir gömlek alayım has ipekten düğmeleri sahici sedeften, yakası kadife, kolları satenden.\nZamanın birinde uzak bir ormanda bir aslan, bir kurt ve bir tilki arkadaş olmuşlar. Birlikte eğlenip birlikte avlanırlarmış. Bir gün yine ormanda avlanırken bir yaban öküzü bulmuşlar. Getirip bir ağaca bağlamışlar. Sonra da bir koyun ve bir tavşan avlayıp onları da yaban öküzünün yanına getirmişler. Akşam olmuş, yemek vakti gelmiş. \nAslan kurda demiş ki;\n- Haydi sen bize avladıklarımızı adaletli bir şekilde paylaştır. Kurt da aslana;\n- Yaban öküzü senin olsun, koyunu ben yiyeyim. Tavşanı da tilkiye verelim, demiş. \nAslan sinirlenmiş; “Bu nasıl adalet” diyerek bir pençe atmış kurda, kurt ölmüş. \nSonra da aslan tilkiye dönerek;\n- Haydi avladıklarımızı bir de sen paylaştır, demiş. \nTilki de demiş ki;\n- Şu tavşan kahvaltın olsun, koyun öğle yemeğin, yaban öküzü de akşam yemeğin olsun.\nAslan şaşırarak;\n- Sen bu adaleti nereden öğrendin? Diye sormuş. \nTilki;\n- Şu, yerde yatan kurttan öğrendim, demiş.",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
