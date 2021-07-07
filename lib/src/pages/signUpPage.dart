import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/customerList.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final myEmailController = TextEditingController();
  bool emailisValid = false;
  bool _toggleVisbility = true;
  bool _toggleConfirmVisbility = true;
  bool isAlreadyRegistered = false;
  var paddingBetweenWidget = SizedBox(
    height: Dimentions.padding32,
  );

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  CustomerList customerList = new CustomerList();

  Widget _buildFirstNameTextFormField() {
    return TextFormField(
      controller: firstNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "First Name",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildLastNameTextFormField() {
    return TextFormField(
      controller: lastNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Last Name",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPhoneTextFormField() {
    return TextFormField(
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Phone Number",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildEmailTextFormField() {
    emailisValid = EmailValidator.validate(emailController.text);
    return TextFormField(
      controller: emailController,
      key: _formKey,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          value == null ? emailisValid = false : emailisValid = true;
        });
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Your Email",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
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

  _createCustomer(
      var email, var firstName, var lastName, var phoneNumber) async {
    try {
      await APIManager()
          .customerSignUp(email, firstName, lastName, phoneNumber);
      //print("Customer Email :::::::   $email");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign Up Successful'),
        ),
      );
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

  @override
  void initState() {
    _customerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            /*image: DecorationImage(
            image: AssetImage('assets/images/coffee-cup.png'),
            fit: BoxFit.cover,
          ),*/
            ),
        child: Padding(
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
                      _buildFirstNameTextFormField(),
                      _buildLastNameTextFormField(),
                      _buildPhoneTextFormField(),
                      _buildEmailTextFormField(),
                      _buildPasswordTextFormField(),
                      //_buildConfirmPasswordTextFormField(),
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
                    for (var i = 0; i < customerList.data.length; i++) {
                      if (customerList.data[i].email
                          .toString()
                          .contains(emailController.value.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Email Already Registered'),
                          ),
                        );
                        isAlreadyRegistered = true;
                        break;
                      }
                    }
                    if (isAlreadyRegistered == false) {
                      emailisValid == false
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please Enter a valid email'),
                              ),
                            )
                          : _createCustomer(
                              emailController.value.text,
                              firstNameController.value.text,
                              lastNameController.value.text,
                              phoneNumberController.value.text);
                      //Navigator.of(context).popAndPushNamed("/");
                    }
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
      ),
    );
  }
}
