import 'package:flutter/material.dart';
import 'package:my_project/themes/themes.dart';
import 'package:provider/provider.dart';
import 'contents_widget.dart';
import 'numbers_widget.dart';
import 'contents_model.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final double coverHeight = 200;
  final double profileHeight = 90;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.isDarkMode ? Icons.dark_mode : Icons
                .light_mode),
            color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .switchTheme();
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildPictures(top),
          const SizedBox(height: 60),
          buildName(),
          const SizedBox(height: 6),
          const Divider(),
          //i wanted to make this a method to so i wouldn't use it more than once but than i would just use the method instead so i just use the widgets.
          buildNumbers(),
          const Divider(),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 500,
            child: Expanded(
              child: ContentContainer(contentList: getList(),),),
          ),
        ],
      ),
    );
  }

  Stack buildPictures(double top) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
            top: top,
            child: buildProfileImage()),
      ],
    );
  }

  Widget buildCoverImage() =>
      Container(
        color: Colors.grey,
        child: Image.asset(
          'assets/bicycle.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() =>
      CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('assets/people.jpg'),

      );

  Widget buildName() =>
      const Center(
        child: Column(
          children: [
            Text(
              'Ronald White',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Dynamic Designer',
              style: TextStyle(color: Color(0xFF757575), fontSize: 13),
            ),
          ],
        ),
      );

  Widget buildNumbers() =>
      IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumbersWidget(value: '15', text: 'Posts',),
            const VerticalDivider(),
            NumbersWidget(value: '240', text: 'Following'),
            const VerticalDivider(),
            NumbersWidget(value: '186', text: 'Followers'),
          ],
        ),
      );

}