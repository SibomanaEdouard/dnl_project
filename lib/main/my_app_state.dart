import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = 0;

  void toggleNavigation(index) {
    current = index;
    notifyListeners();
  }
}
