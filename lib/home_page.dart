import 'package:flutter/material.dart';
import 'package:my_project/profile_page_1/profile_page.dart';
import 'package:my_project/profile_page_2/profile_page_2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
            icon: Icon(Icons.person),
          ),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage2()),
            );
          },
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );

  }
}
