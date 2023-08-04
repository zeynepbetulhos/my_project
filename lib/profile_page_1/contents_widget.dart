import 'package:flutter/material.dart';
import 'package:my_project/themes/themes.dart';
import 'package:provider/provider.dart';

class ContentContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String liked;
  final String seen;


  ContentContainer({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.liked,
    required this.seen,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer <ThemeNotifier>(
      builder: (context, themeNotifier, child) {
      return Container(
        width: 350,
        height: 120,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
            ),
          ],
        ),

        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(imagePath),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,),
                      ),
                      SizedBox(height: 3.0),
                      Flexible(
                        child: Text(
                          description,
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Icon(Icons.favorite_border, color: Colors.grey, size: 15.0,),
                          SizedBox(width: 2.0),
                          Text(liked, style: TextStyle(fontSize: 10.0, color: Colors.grey),),
                          SizedBox(width: 20.0),
                          Icon(Icons.remove_red_eye_outlined, color: Colors.grey, size: 15.0,),
                          Text(seen, style: TextStyle(fontSize: 10.0, color: Colors.grey),),
                        ],
                      )
                    ],
                  ),
                ),
            ),
          ],
        ),
      );
    }
    );
  }
}
