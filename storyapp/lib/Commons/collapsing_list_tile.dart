import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  CollapsingListTile({
    @required this.title,
    @required this.icon,
    @required this.animationController,
  });

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnimation, sizeBoxAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widthAnimation =
        Tween<double>(begin: 250, end: 60).animate(widget.animationController);
    sizeBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: Colors.deepPurple[200],
            size: 38.0,
          ),
          SizedBox(
            width: sizeBoxAnimation.value,
          ),
          (widthAnimation.value >= 220)
              ? Text(
                  widget.title,
                  style: listTitleDefaultTextStyle,
                )
              : Container(),
        ],
      ),
    );
  }
}
