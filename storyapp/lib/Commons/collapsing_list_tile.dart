import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  CollapsingListTile({@required this.title, @required this.icon});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon,color: Colors.white30,),
        SizedBox(width: 10.0,),
        Text(widget.title),
      ],
    );
  }
}
