import 'package:flutter/material.dart';

enum MyThemes {
  light,
  dark,
}

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;
  bool _isDarkMode = false;

  ThemeMode get currentTheme => _currentTheme;

  bool get isDarkMode => _isDarkMode;

  void switchTheme() {
    _isDarkMode =! _isDarkMode;
    _currentTheme =! _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

