import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/profile_page_2/informations_widget.dart';
import 'package:provider/provider.dart';

import '../themes/themes.dart';

class ProfilePage2 extends StatelessWidget {
  const ProfilePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Personal Info', style: TextStyle(color: Colors.grey,
            fontSize: 25.0,
            fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .switchTheme();
            },
          ),
        ],
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 50.0),
          buildProfile(),
          const SizedBox(height: 20.0),
          buildName2(),
          const SizedBox(height: 50),
          buildInformation(),
        ],
      ),
    );
  }

  Widget buildProfile() =>
      const CircleAvatar(
        backgroundImage: AssetImage('assets/woman.jpg'),
        radius: 60.0,
        backgroundColor: Colors.grey,
      );

  Widget buildName2() => Center(
    child: Column(
      children: [
        const Text(
          'Name Surname',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize:25,
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: const Text(
            'type specimen book. it has survived not only five centuries',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    ),
  );

  buildInformation()  => Column(
    children: [
      InformationsContainer(iconData: Icons.person, text: 'Profile Info'),
      InformationsContainer(iconData: Icons.history, text: 'History'),
      InformationsContainer(iconData: Icons.format_list_bulleted, text: 'Category'),
      InformationsContainer(iconData: Icons.translate, text: 'Language'),
      InformationsContainer(iconData: CupertinoIcons.sun_max, text: 'Theme'),
      ],
  );

}
