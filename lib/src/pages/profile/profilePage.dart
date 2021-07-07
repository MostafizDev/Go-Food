import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _id = "";

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    return Center(
      child: Container(
        child: Text("Your Id :: $_id"),
      ),
    );
  }
}
