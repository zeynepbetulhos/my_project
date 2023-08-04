import 'package:flutter/material.dart';
import 'package:my_project/themes/themes.dart';
import 'package:provider/provider.dart';

class InformationsContainer extends StatelessWidget {
  final IconData iconData;
  final String text;

  InformationsContainer({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Container(
          height: 80,
          color: themeNotifier.isDarkMode ? Color(0xFFE3F2FD) : Color(0xFF1A237E),
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              ClipOval(
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Color(0xFF00838F),
                    child: Icon(iconData, color: Colors.white,)),
              ),
              SizedBox(width: 40),
              Expanded(
                  child: Text(text, style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),)),
              Icon(Icons.navigate_next, size: 30.0,),
            ],
          ),
        );
      }
    );
  }
}
