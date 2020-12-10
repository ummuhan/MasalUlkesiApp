import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationsItem = [
  NavigationModel(title: "Tüm Masallar", icon: Icons.all_inbox),
  NavigationModel(title: "Ayarlar", icon: Icons.settings),
  NavigationModel(title: "Paylaş", icon: Icons.share),
  NavigationModel(title: "Begen", icon: Icons.favorite),
  NavigationModel(title: "Bize Ulaş", icon: Icons.message),
];
