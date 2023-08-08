import 'package:flutter/material.dart';
import 'package:my_project/themes/themes.dart';
import 'package:provider/provider.dart';
import 'contents_model.dart';

class ContentContainer extends StatelessWidget {
  final List<ContentModel> contentList;

  ContentContainer({
    required this.contentList
  });

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return ListView.builder(
      itemCount: contentList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 350,
          height: 120,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 4,
              ),
            ],
          ),

          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(contentList[index].imagePath),
              ),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contentList[index].title,
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,),
                        ),
                        const SizedBox(height: 3.0),
                        Flexible(
                          child: Text(
                            contentList[index].description,
                            style: const TextStyle(fontSize: 15.0, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            const Icon(Icons.favorite_border, color: Colors.grey, size: 15.0,),
                            const SizedBox(width: 2.0),
                            Text(contentList[index].liked, style: const TextStyle(fontSize: 10.0, color: Colors.grey),),
                            const SizedBox(width: 20.0),
                            const Icon(Icons.remove_red_eye_outlined, color: Colors.grey, size: 15.0,),
                            Text(contentList[index].seen, style: const TextStyle(fontSize: 10.0, color: Colors.grey),),
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            ],
          ),
        );
      },
    );
  }
}
