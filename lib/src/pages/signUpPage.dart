import 'package:flutter/material.dart';
import 'package:go_food/src/constants/dimentions.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _toggleVisbility = true;
  bool _toggleConfirmVisbility = true;
  var paddingBetweenWidget = SizedBox(
    height: Dimentions.padding32,
  );

  Widget _buildEmailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your Email",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildUsernameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your Username",
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

  Widget _buildConfirmPasswordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _toggleConfirmVisbility = !_toggleConfirmVisbility;
              });
            },
            icon: _toggleConfirmVisbility
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          )),
      obscureText: _toggleConfirmVisbility,
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
              "Sign Up",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            paddingBetweenWidget,
            Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(Dimentions.padding16),
                child: Column(
                  children: [
                    _buildEmailTextFormField(),
                    _buildUsernameTextFormField(),
                    _buildPasswordTextFormField(),
                    _buildConfirmPasswordTextFormField(),
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
                  "Sign Up",
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
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("SignInPage");
                  },
                  child: Text(
                    "Sign In",
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
