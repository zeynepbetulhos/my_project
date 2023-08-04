import 'package:flutter/material.dart';
import 'package:my_project/themes/themes.dart';
import 'package:provider/provider.dart';
import 'contents_widget.dart';
import 'numbers_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  final double coverHeight = 200;
  final double profileHeight = 90;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Consumer<ThemeNotifier>(
          builder: (context,themeNotifier, child) {
            return IconButton(
                icon: Icon(Icons.arrow_back),
                color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }
            );
          },
        ),
        actions: [
          Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, child) {
              return IconButton(
                icon: Icon(themeNotifier.isDarkMode ? Icons.dark_mode : Icons
                    .light_mode),
                color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
                onPressed: () {
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .switchTheme();
                },
              );
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
          SizedBox(height: 6),
          Divider(), //i wanted to make this a method to so i wouldn't use it more than once but than i would just use the method instead so i just use the widgets.
          buildNumbers(),
          Divider(),
          SizedBox(height: 10.0),
          buildContents(),
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

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.asset(
      'assets/bicycle.jpg',
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: AssetImage('assets/people.jpg'),

  );

  Widget buildName() => const Center(
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

 Widget buildContents() => Column(
   children: [
     ContentContainer(imagePath:'assets/plant.jpg', title: 'Dangling train', description: 'On the swaying train, I seem to think a lot about things.', liked: '259', seen: '2356'),
     SizedBox(height: 7.0),
     ContentContainer(imagePath: 'assets/sunset.jpg', title: 'Forest of Love', description: 'Love for life. It is love that makes us meet.', liked: '315', seen: '2689'),
     SizedBox(height: 7.0),
     ContentContainer(imagePath: 'assets/airplane.jpg', title: 'Somwhere else', description: 'Emotions are neither future nor past', liked: '518', seen: '3590'),
     SizedBox(height: 7.0),
     ContentContainer(imagePath: 'assets/chair.jpg', title: 'At first you hated it', description: 'You cant start wihout them', liked: '300', seen: '3789'),
   ],
 );

  Widget buildNumbers() => IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        NumbersWidget(value: '15', text: 'Posts',),
        VerticalDivider(),
        NumbersWidget(value:'240', text: 'Following'),
        VerticalDivider(),
        NumbersWidget(value:'186', text:'Followers'),
      ],
    ),
  );
}
