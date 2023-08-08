import 'package:flutter/material.dart';
import 'package:my_project/themes/themes.dart';
import 'package:provider/provider.dart';

class InformationsContainer extends StatelessWidget {
  final IconData iconData;
  final String text;

  InformationsContainer({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Container(
          height: 80,
          color: themeNotifier.isDarkMode ? const Color(0xFFE3F2FD) : const Color(0xFF1A237E),
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ClipOval(
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: const Color(0xFF00838F),
                    child: Icon(iconData, color: Colors.white,)),
              ),
              const SizedBox(width: 40),
              Expanded(
                  child: Text(text, style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),)),
              const Icon(Icons.navigate_next, size: 30.0,),
            ],
          ),
        );
  }
}
