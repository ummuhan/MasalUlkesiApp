import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BgColorModel {
  Color color1;
  Color color2;

  BgColorModel({this.color1, this.color2});
}

List<BgColorModel> bgColorItem = [
  BgColorModel(color1: Color(0xFFdf80ff),color2:Color(0xFFff80bf) ),
  BgColorModel(color1: Color(0xFF80ffbf),color2:Color(0xFFff80bf)),
  BgColorModel(color1: Color(0xFFffdf80),color2:Color(0xFFff80bf)),
  BgColorModel(color1: Color(0xFFff80bf),color2:Color(0xFFff80bf)),
  BgColorModel(color1: Color(0xFF4db8ff),color2:Color(0xFFff80bf)),
];
