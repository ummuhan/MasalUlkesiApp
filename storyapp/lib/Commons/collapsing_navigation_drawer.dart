import 'package:flutter/material.dart';
import 'package:storyapp/Colors/constants.dart';
import 'package:storyapp/Commons/collapsing_list_tile.dart';
import 'package:storyapp/model/navigation_model.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  const CollapsingNavigationDrawer({Key key}) : super(key: key);

  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 60;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, builder) => getWidget(context, builder));
  }

  getWidget(context, builder) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CollapsingListTile(
            title: "Masal Ülkesi",
            icon: Icons.taxi_alert,
            animationController: _animationController,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                  title: navigationsItem[counter].title,
                  icon: navigationsItem[counter].icon,
                  animationController: _animationController,
                );
              },
              itemCount: navigationsItem.length,
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 50.0))
        ],
      ),
    );
  }
}
