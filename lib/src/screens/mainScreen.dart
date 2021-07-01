import 'package:flutter/material.dart';
import 'package:go_food/src/constants/themes.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/pages/homepage/homePage.dart';
import 'package:go_food/src/pages/orderPage/orderPage.dart';
import 'package:go_food/src/pages/profile/profilePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  final int currentTabIndex;

  const MainScreen({
    Key key,
    this.currentTabIndex,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  var changeTab;

  bool isDrawerOpen = false;

  /*int currentTabIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();*/

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
    return AnimatedContainer(
      //margin: EdgeInsets.only(bottom: 50.0),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      color: Colors.white,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDrawerOpen
                  ? IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          xOffset = 250;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          isDrawerOpen = true;
                        });
                      }),
              widget.currentTabIndex == 0
                  ? Text(
                      'Go Food',
                      style: TextStyle(color: Colors.black),
                    )
                  : widget.currentTabIndex == 1
                      ? Text(
                          'Cart',
                          style: TextStyle(color: Colors.black),
                        )
                      : widget.currentTabIndex == 2
                          ? Text(
                              'Profile',
                              style: TextStyle(color: Colors.black),
                            )
                          : null,
              InkWell(
                onTap: () {
                  setState(() {
                    // ignore: unnecessary_statements
                    changeTab = 1;
                    print('Tapped On Cart Inside : $changeTab');
                  });
                  MainScreen(currentTabIndex: changeTab,);
                  print('Tapped On Cart  : $changeTab');
                },
                child: Padding(
                  padding: EdgeInsets.only(right: Dimentions.padding16),
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: widget.currentTabIndex == 0
                ? homePage
                : widget.currentTabIndex == 1
                    ? orderPage
                    : widget.currentTabIndex == 2
                        ? profilePage
                        : null,
          ),
        ],
      ),
    );
    /*bottomNavigationBar: CurvedNavigationBar(
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
      ),*/
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
  }
}
