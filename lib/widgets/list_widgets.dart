import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';

class ListWidget extends StatefulWidget {
  final String baslik;

  const ListWidget({Key key, this.baslik}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(),
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
                "${widget.baslik}",
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
}
