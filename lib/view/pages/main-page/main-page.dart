import 'package:flutter/material.dart';
import 'package:vezeeta_clone/view/pages/main-page/homePage.dart';
import 'package:vezeeta_clone/view/pages/main-page/profile-page.dart';
import 'package:vezeeta_clone/view/styles/colors.dart';

import 'activities-page.dart';
int selectedIndex =0;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexPage = 0;
  List<Widget> _pagesList =[
    HomePage(),
    ActivitiesPage(),
    ProfilePage()
  ];

  void _onTapNavigator(int index){
    setState(() {
      indexPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.scaffoldBackGroundColor,
        body: _pagesList.elementAt(indexPage),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined),label: "My Activity"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: "My Profile"),
          ],
        onTap: _onTapNavigator,
          currentIndex: indexPage,
        ),
      ),
    );
  }
}
