import 'package:flutter/material.dart';

enum MyThemes {
  light,
  dark,
}

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  bool _isDarkMode = false;

  ThemeData get currentTheme => _currentTheme;

  bool get isDarkMode => _isDarkMode;

  void switchTheme() {
    _isDarkMode =! _isDarkMode;
    _currentTheme =! _isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}

