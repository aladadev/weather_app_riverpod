import 'package:flutter/material.dart';
import 'package:weather_app/views/home/homepage.dart';
import 'package:weather_app/views/profile/profilepage.dart';
import 'package:weather_app/views/settings/settingpage.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        selectedItemColor: Colors.redAccent,
        items: items.map((e) => e).toList(),
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
      ),
      body: getBody(_pageIndex),
    );
  }
}

Widget getBody(int index) {
  switch (index) {
    case 0:
      return HomePage();
    case 1:
      return const ProfilePage();
    case 2:
      return const SettingPage();
    default:
      return HomePage();
  }
}

const List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.people_rounded,
    ),
    label: 'Profile',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.settings,
    ),
    label: 'Setting',
  ),
];
