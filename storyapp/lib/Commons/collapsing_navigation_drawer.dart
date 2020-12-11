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
  double maxWidth = 200;
  double minWidth = 60;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;
  @override
  void initState() {
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
          Divider(
            color: Colors.grey,
            height: 50.0,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(
                    color: Colors.grey[400],
                    height: 20.0,
                  );
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {},
                    isSelected: currentSelectedIndex==counter,
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
