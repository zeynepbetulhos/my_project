import 'package:flutter/material.dart';
import 'package:my_project/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeNotifier>(context).currentTheme,
        home: HomePage(),
      );
  }
}


