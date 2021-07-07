import 'package:flutter/material.dart';
import 'package:go_food/src/constants/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _id = "";
class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var drawerMenuTextStyle = TextStyle(
    color: kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  _loadSignedInCustomerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _id = (prefs.getString('id') ?? '');
    });
    print('Shared Preferences Id ::: $_id');
  }

  @override
  void initState() {
    _loadSignedInCustomerId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _id,
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                  Text('Flutter Developer',
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite_border_sharp,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Favorites',
                    style: drawerMenuTextStyle,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log out',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
