import 'package:flutter/material.dart';
import 'package:storyapp/Style/text_style.dart';

class ListWidget extends StatefulWidget {
  final String masalAdi;
  final int masalKategori;
  const ListWidget({Key key, this.masalAdi, this.masalKategori}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            //  border: Border.all(),
            color: Colors.purple[200],
            borderRadius: BorderRadius.circular(30)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.purple[300],
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/giraffe.png"),
                  )),
              flex: 2,
            ),
            Expanded(
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.masalAdi}",
                    style: listWidgetsTittleStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                     "${widget.masalKategori}",
                    style: listWidgetsCategoryStyle,
                  )
                ],
              )),
              flex: 4,
            )
          ],
        ));
  }
}
