import 'dart:convert';
import 'package:go_food/src/constants/Url.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/models/categoryModel.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<Category> getCategory() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
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

  Future addToCart(var id) async {
    var _response;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
    };
    var body = {
      "id": id,
    };
    var client = http.Client();

    try {
      var response = await client.post(Uri.parse(Url.addToCartAPIURL),
          headers: requestHeaders, body: body);

      print(response.body);

      if (response.statusCode == 200) {
        _response = response;
      }
    } on Exception catch (e) {
      // TODO

      _response = null;
    }

    return _response;
  }

  Future<ProductModel> getProducts() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
    };

    var client = http.Client();
    var productmodel = null;
    var response = await client.get(Uri.parse(Url.productsAPIURL),
        headers: requestHeaders);

    print("Rsponse :::: ${response.statusCode}");
    print("Rsponse :::: ${response.body}");
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);
      print('sdfasdafds ${jsonMap['meta']}');

      productmodel = ProductModel.fromJson(jsonMap);
      print("::::::::::::::::::::::::::::::::::::: $productmodel");
    }
    return productmodel;
  }
}
