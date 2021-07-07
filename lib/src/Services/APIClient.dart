import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/Url.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/models/categoryModel.dart';
import 'package:go_food/src/models/createCustomer.dart';
import 'package:go_food/src/models/customerList.dart';
import 'package:go_food/src/models/deleteCartItem.dart';
import 'package:go_food/src/models/retrieveCartItem.dart';
import 'package:go_food/src/models/signInTokenGenerate.dart';
import 'package:go_food/src/models/signInTokenIssue.dart';
import 'package:go_food/src/models/updateCartItem.dart';
import 'package:http/http.dart' as http;

class APIManager {
  var publicKey = 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016';
  var secretKey = 'sk_26762ffb0c571a9139d720e6dc0470fd9e126d01cbed4';
  var baseURL = 'https://gofood.com';

  Future<Category> getCategory() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Authorization': '$publicKey',
    };

    var client = http.Client();
    var categorymodel = null;

    try {
      var response = await client.get(Uri.parse(Url.categoryAPIURL),
          headers: requestHeaders);

      /*print("Rsponse :::: ${response.statusCode}");
      print("Rsponse :::: ${response.body}");*/
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        categorymodel = Category.fromJson(jsonMap);
        // print("::::::::::::::::::::::::::::::::::::: $categorymodel");
      }
    } catch (e) {
      print("Exception : $e");
      //return categorymodel;
    }
    return categorymodel;
  }

  Future addToCart(var id, var quantity) async {
    var _response;
    Map<String, String> requestHeaders = {
      'X-Authorization': '$publicKey',
    };
    var body = {
      "id": "$id",
      //"quantity": "$quantity",
    };
    var client = http.Client();

    try {
      var response = await client.post(Uri.parse(Url.addToCartAPIURL),
          headers: requestHeaders, body: body);

      /*print(response.body);
      print(response.statusCode);
      print('Cart Product Id ::: $id');*/

      if (response.statusCode == 200) {
        _response = response;
      }
    } on Exception catch (e) {
      // TODO
      print("Error for Add to Cart: $e");

      _response = null;
    }

    return _response;
  }

  Future<ProductModel> getProducts() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Authorization': '$publicKey',
    };

    var client = http.Client();
    var productmodel = null;
    var response = await client.get(Uri.parse(Url.productsAPIURL),
        headers: requestHeaders);

    /* print("Rsponse :::: ${response.statusCode}");
    print("Rsponse :::: ${response.body}");*/
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);
      /*print('sdfasdafds ${jsonMap['meta']}');*/

      productmodel = ProductModel.fromJson(jsonMap);
      /*print("::::::::::::::::::::::::::::::::::::: $productmodel");*/
    }
    return productmodel;
  }

  Future<RetrieveCartItem> getCartProducts() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Authorization': '$publicKey',
    };

    var client = http.Client();
    var response = await client.get(Uri.parse(Url.retrieveCartAPIURL),
        headers: requestHeaders);
    var cartProductmodel = null;

    /*print("Rsponse :::: ${response.statusCode}");
    print("Rsponse :::: ${response.body}");*/
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);
      //print('JSONMap ::  ${jsonMap['id']}');

      cartProductmodel = RetrieveCartItem.fromJson(jsonMap);
      //print("::::::::::::::::::::::::::::::::::::: $cartProductmodel");
    }
    return cartProductmodel;
  }

  Future<UpdateCartItem> updateCartItem(var itemId, var quantity) async {
    var _response;
    Map<String, String> requestHeaders = {
      'X-Authorization': '$publicKey',
    };
    var body = {
      "quantity": "$quantity",
    };
    var client = http.Client();

    try {
      var response = await client.put(
          Uri.parse(Url.updateCartItemAPIURL + itemId),
          headers: requestHeaders,
          body: body);

      /*print(response.body);
      print(response.statusCode);
      print('Cart Product Id ::: $itemId'+'& $quantity items');*/

      if (response.statusCode == 200) {
        return UpdateCartItem.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      print("Update Cart Error From APIClient: $e");
    }
  }

  Future<DeleteCartItem> deleteCartItem(var itemId) async {
    //var _response;
    Map<String, String> requestHeaders = {
      'X-Authorization': '$publicKey',
    };
    var client = http.Client();

    try {
      var response = await client.put(
          Uri.parse(Url.deleteCartItemAPIURL + itemId),
          headers: requestHeaders);

      /*print('Response :: ${response.body}');
      print('Response :: ${response.statusCode}');
      print('Deleted Cart Product Id From API ::: $itemId');*/

      if (response.statusCode == 200) {
        //print('Deleted Cart Product Id From API ::: $itemId');
        return DeleteCartItem.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      print("Delete Error: $e");
    }
  }

  Future customerSignUp(
      var email, var firstName, var lastName, var phoneNumber) async {
    var client = http.Client();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'X-Authorization': '$secretKey',
    };
    /*var body = {
      "email": "$email",
    };*/
    var createCustomerAPI =
        '${Url.customerAPIURL}?&email=$email&phone=$phoneNumber&firstname=$firstName&lastname=$lastName';

    try {
      var response = await client.post(Uri.parse(createCustomerAPI),
          headers: requestHeaders);

      print('Response :: ${response.body}');
      print('Response :: ${response.statusCode}');
      print('Response Email :: $email');

      if (response.statusCode == 200) {
        return CreateCustomer.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      print("Customer Create Error: $e");
    }
  }

  Future customerSignInTG(var email) async {
    var client = http.Client();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'X-Authorization': '$secretKey',
    };
    /*var body = {
      "email": "$email",
    };*/
    var signTokenGenerateAPI = '${Url.customerTokenGenerateAPIURL}?&email=$email&base_url=$baseURL';

    try {
      var response = await client.post(Uri.parse(signTokenGenerateAPI),
          headers: requestHeaders);

      print('Response :: ${response.body}');
      print('Response :: ${response.statusCode}');
      print('Response Email :: $email');

      if (response.statusCode == 200) {
        return SignInTokenGenerate.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      print("Customer TG Create Error: $e");
    }
  }

  Future customerSignInTI(var email) async {
    var client = http.Client();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'X-Authorization': '$secretKey',
    };
    /*var body = {
      "email": "$email",
    };*/
    var signTokenIssueAPI = '${Url.customerTokenIssueAPIURL}?&email=$email&base_url=$baseURL';

    try {
      var response = await client.post(Uri.parse(signTokenIssueAPI),
          headers: requestHeaders);

      print('Response :: ${response.body}');
      print('Response :: ${response.statusCode}');
      print('Response Email :: $email');

      if (response.statusCode == 200) {
        return SignInTokenIssue.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      print("Customer TI Create Error: $e");
    }
  }

  Future<CustomerList> customerList() async {
    var client = http.Client();
    Map<String, String> requestHeaders = {
      'X-Authorization': '$secretKey',
    };
    /*var body = {
      "email": "$email",
    };*/

    try {
      var response = await client.get(Uri.parse(Url.customerAPIURL),
          headers: requestHeaders);

      print('Response :: ${response.body}');
      /*print('Response :: ${response.statusCode}');*/

      if (response.statusCode == 200) {
        return CustomerList.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      print("Customer Create Error: $e");
    }
  }
}
