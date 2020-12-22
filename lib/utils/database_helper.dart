import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:storyapp/model/masal.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  Database _database;

  List<Masal> masalList = List<Masal>();
  final String localJsonPath = 'assets/masal.json';
  Future<void> loadLocalJson() async {
    var masalData = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(masalData);
    masalList = decodedJson.map((user) => Masal.fromMap(user)).toList();

    return masalList;
  }

}
