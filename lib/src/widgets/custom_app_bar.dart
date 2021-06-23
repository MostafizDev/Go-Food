import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: Colors.white,
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_rounded,
              ),
            ),
          )
        ],
      ),
    );
  }
}
