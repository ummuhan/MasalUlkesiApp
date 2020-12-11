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
  double maxWidth = 230;
  double minWidth = 60;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
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
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 7,
            child: Image.asset("assets/images/unicorn.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
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
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController,
                  color: Colors.white,
                  size: 50.0)),
        ],
      ),
    );
  }
}
