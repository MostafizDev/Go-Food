import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/dimentions.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _toggleVisbility = true;
  var paddingBetweenWidget = SizedBox(
    height: Dimentions.padding16,
  );

  Widget _buildEmailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your Email or UserName",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _toggleVisbility = !_toggleVisbility;
              });
            },
            icon: _toggleVisbility
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          )),
      obscureText: _toggleVisbility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            paddingBetweenWidget,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgotten Password?",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
            Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(Dimentions.padding16),
                child: Column(
                  children: [
                    _buildEmailTextFormField(),
                    _buildPasswordTextFormField(),
                  ],
                ),
              ),
            ),
            paddingBetweenWidget,
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(35.0)),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/");
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have any account?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("SignUpPage");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
