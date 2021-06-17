import 'package:flutter/material.dart';
import 'package:go_food/src/pages/homepage/homePage.dart';
import 'package:go_food/src/pages/orderPage.dart';
import 'package:go_food/src/pages/profile/profilePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  HomePage homePage;
  OrderPage orderPage;
  ProfilePage profilePage;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage = HomePage();
    orderPage = OrderPage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, profilePage];

    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentTabIndex == 0
          ? AppBar(
              title: Text(
                'Go Food',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
            )
          : currentTabIndex == 1
              ? AppBar(
                  title: Text(
                    'Cart',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                )
              : currentTabIndex == 2
                  ? AppBar(
                      title: Text(
                        'Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                    )
                  : null,
      //body: currentPage,
      body: currentTabIndex == 0 ? homePage : currentTabIndex == 1 ? orderPage : currentTabIndex == 0 ? profilePage : null,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.shopping_cart_outlined, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.orange,
        buttonBackgroundColor: Colors.orangeAccent,
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
      /*bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTabIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Shopping Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
      ),*/
    );
  }
}
