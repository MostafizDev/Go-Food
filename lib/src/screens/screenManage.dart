import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/constants.dart';
import 'package:go_food/src/pages/homepage/homePage.dart';
import 'package:go_food/src/screens/drawerScreen.dart';
import 'package:go_food/src/screens/mainScreen.dart';

class ScreenManage extends StatefulWidget {

  @override
  _ScreenManageState createState() => _ScreenManageState();
}

class _ScreenManageState extends State<ScreenManage> {
  int currentTabIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainScreen(currentTabIndex: currentTabIndex,),
          //HomePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.shopping_cart_outlined, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: kPrimaryColor,
        buttonBackgroundColor: kPrimaryLightColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOutSine,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),

    );
  }
}
