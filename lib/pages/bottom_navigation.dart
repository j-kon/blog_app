import 'package:flutter/material.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/widgets.dart';
import 'package:blog_app/utils/widgets/bottom_navigationbar.dart';

class T4BottomNavigation extends StatefulWidget {
  static var tag = "/T4BottomNavigation";

  @override
  T4BottomNavigationState createState() => T4BottomNavigationState();
}

class T4BottomNavigationState extends State<T4BottomNavigation> {
  var _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(app_background);

    return Scaffold(
      backgroundColor: app_background,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: shadow_color,
              offset: Offset.fromDirection(3, 1),
              spreadRadius: 1,
              blurRadius: 5)
        ]),
        child: T4BottomNavigationBar(
          items: const <T4BottomNavigationBarItem>[
            T4BottomNavigationBarItem(
              icon: home,
            ),
            T4BottomNavigationBarItem(
              icon: playbutton,
            ),
            T4BottomNavigationBarItem(
              icon: heart,
            ),
            T4BottomNavigationBarItem(
              icon: user,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme:
              IconThemeData(color: textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T4BottomNavigationBarType.fixed,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 180,
            alignment: Alignment.center,
            child: ring(" Welcome to Bottom\nNavigation Bar"),
          ),
          TopBar("Bottom Navigation")
        ],
      ),
    );
  }
}
