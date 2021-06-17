import 'package:flutter/material.dart';
import 'package:go_food/src/pages/homepage/homePage.dart';
import 'package:go_food/src/pages/signInPage.dart';
import 'package:go_food/src/pages/signUpPage.dart';
import 'package:go_food/src/screens/homeScreen.dart';
import 'package:go_food/src/screens/mainScreen.dart';

class RouteGenerator {
	static Route<dynamic> generateRoute(RouteSettings settings) {
		// Getting arguments passed in while calling Navigator.pushNamed
		final args = settings.arguments;
		switch (settings.name) {
			case '/':
				return MaterialPageRoute(builder: (_) => MainScreen());
			case 'SignInPage':
				return MaterialPageRoute(builder: (_) => SignInPage());
			case 'SignUpPage':
				return MaterialPageRoute(builder: (_) => SignUpPage());
			default:
			// If there is no such named route in the switch statement, e.g. /third
				return _errorRoute();
		}
	}

	static Route<dynamic> _errorRoute() {
		return MaterialPageRoute(builder: (_) {
			return Scaffold(
				appBar: AppBar(
					title: Text('Error'),
				),
				body: Center(
					child: Text('ERROR'),
				),
			);
		});
	}
}