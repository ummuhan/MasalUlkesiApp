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

class _CollapsingNavigationDrawerState
    extends State<CollapsingNavigationDrawer> {
  double maxWidth = 250;
  double minWidth = 70;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: drawerBackgroundColor,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                  title: navigationsItem[counter].title,
                  icon: navigationsItem[counter].icon,
                );
              },
              itemCount: navigationsItem.length,
            ),
          )
        ],
      ),
    );
  }
}
