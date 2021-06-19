import 'package:flutter/material.dart';
import 'package:go_food/src/constants/constants.dart';

class HomeTopInfo extends StatefulWidget {
  @override
  _HomeTopInfoState createState() => _HomeTopInfoState();
}

class _HomeTopInfoState extends State<HomeTopInfo> {
  final welcomeTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What Would",
              style: welcomeTextStyle,
            ),
            Text(
              "you like to eat?",
              style: welcomeTextStyle,
            ),
          ],
        ),
        Icon(
          Icons.notifications_none_rounded,
          size: 32,
          color: kPrimaryLightColor,
        ),
      ],
    );
  }
}
