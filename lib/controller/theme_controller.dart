import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool _darkTheme = false;

  bool get isDarkTheme => _darkTheme;

  set isDarkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
