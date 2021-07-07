import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/customerList.dart';
import 'package:go_food/src/models/signInTokenGenerate.dart';
import 'package:go_food/src/models/signInTokenIssue.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final myEmailController = TextEditingController();
  bool emailisValid = false;
  bool _toggleVisbility = true;
  bool isAlreadyRegistered = true;

  String _id= '';

  SignInTokenGenerate signInTokenGenerate;
  SignInTokenIssue signInTokenIssue;
  CustomerList customerList = new CustomerList();

  var paddingBetweenWidget = SizedBox(
    height: Dimentions.padding16,
  );

  Widget _buildEmailTextFormField() {
    emailisValid = EmailValidator.validate(myEmailController.text);
    return TextFormField(
      key: _formKey,
      controller: myEmailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          EmailValidator.validate(value) == null ? emailisValid = false : emailisValid = true;
          //value == null ? emailisValid = false : emailisValid = true;
        });
      },
      decoration: InputDecoration(
        hintText: "Your Email",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  /*Widget _buildPasswordTextFormField() {
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
        ),
      ),
      obscureText: _toggleVisbility,
    );
  }*/

  _signInTokenGenerate(var email) async {
    try {
      await APIManager().customerSignInTG(email);
      //print("Customer Id Token Generate :::   ${signInTokenGenerate.success}");
    } catch (e) {
      print("Error Creating Customer : $e");
    }
  }

  _signInTokenIssue(var email) async {
    try {
      await APIManager().customerSignInTI(email);
      //print("Customer Id Token Issue ::::::   ${signInTokenIssue.customerId}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _id = email;
        print('Shared Email :: $_id');
      });
      prefs.setString('id', _id);

    } catch (e) {
      print("Error Creating Customer : $e");
    }
  }

  _customerList() async {
    try {
      customerList = await APIManager().customerList();
      //print("Customer Email :::::::   ${customerList.data[0].email}");
    } catch (e) {
      print("Error Creating Customer : $e");
    }
  }

  _loadSignedInCustomerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _id = (prefs.getString('id') ?? '');
    });
  }

  @override
  void initState() {
    _customerList();
    _loadSignedInCustomerId();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    emailisValid = EmailValidator.validate(myEmailController.text);
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
                    //_buildPasswordTextFormField(),
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
                  _signInTokenGenerate(myEmailController.value.text);
                  _signInTokenIssue(myEmailController.value.text);

                  for (var i = 0; i < customerList.data.length; i++) {
                    if (customerList.data[i].email
                        .toString()
                        .contains(myEmailController.value.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Success'),
                        ),
                      );
                      //print("Customer Id Token Issue ::::::   ${signInTokenIssue.customerId}");
                      //Get.toNamed('/');
                      Navigator.of(context).popAndPushNamed("/");
                      isAlreadyRegistered = true;
                      break;
                    } else if (emailisValid == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter your mail'),
                        ),
                      );
                      break;
                    } else if (myEmailController.value.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter your mail'),
                        ),
                      );
                      break;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'You don\'t have any account. Please Sign Up first'),
                        ),
                      );
                      break;
                    }
                  }

                  /*emailisValid
                      ?  ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please enter your mail'),
                              ),
                            )
                          : Navigator.of(context).popAndPushNamed("/");*/
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
