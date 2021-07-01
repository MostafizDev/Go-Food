import 'dart:convert';
import 'package:go_food/src/constants/Url.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/models/categoryModel.dart';
import 'package:go_food/src/models/deleteCartItem.dart';
import 'package:go_food/src/models/retrieveCartItem.dart';
import 'package:go_food/src/models/updateCartItem.dart';
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

  Future addToCart(var id, var quantity) async {
    var _response;
    Map<String, String> requestHeaders = {
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
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
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
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
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
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
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
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
      // TODO
      /*print("Update Cart Error From APIClient: $e");*/

    }
  }

  Future<DeleteCartItem> deleteCartItem(var itemId) async {
    var _response;
    Map<String, String> requestHeaders = {
      'X-Authorization': 'pk_267624ff9adb23a3e0d054aa7ac4d5efde482e3e13016'
    };
    var client = http.Client();

    try {
      var response = await client.put(
          Uri.parse(Url.deleteCartItemAPIURL + itemId),
          headers: requestHeaders);

      print('Response :: ${response.body}');
      print('Response :: ${response.statusCode}');
      print('Deleted Cart Product Id From API ::: $itemId');

      if (response.statusCode == 200) {
        print('Deleted Cart Product Id From API ::: $itemId');
        return DeleteCartItem.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (e) {
      // TODO
      print("Delete Error: $e");
    }
  }
}
