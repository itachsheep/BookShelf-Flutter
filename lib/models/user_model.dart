import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _name = "";

  String get value => _name;

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
