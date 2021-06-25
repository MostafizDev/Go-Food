import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/themes.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/retrieveCartItem.dart';
import 'package:go_food/src/models/updateCartItem.dart';
import 'package:go_food/src/pages/orderPage/orderCard.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
  Stream<int>.periodic(Duration(seconds: 3), (x) => refreshNum);

  RetrieveCartItem cartProducts = new RetrieveCartItem();
  UpdateCartItem updateCartItem = new UpdateCartItem();

  var paddingBetweenText = SizedBox(
    height: Dimentions.padding10,
  );

  _callCartProduct() async {
    try {
      cartProducts = await APIManager().getCartProducts();

      setState(() {});
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }

  /*_updateCartItem(var itemId, var quantity) async {
    try {
      updateCartItem = await APIManager().updateCartItem(itemId, quantity);
      print("CART Item Id :::::::   ${updateCartItem.productId}");

      setState(() {});
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }*/

  @override
  void initState() {
    super.initState();
    _callCartProduct();
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = new Random().nextInt(100);
      _callCartProduct();
    });
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      key: _refreshIndicatorKey,
      onRefresh: _handleRefresh,
      showChildOpacityTransition: false,
      child: StreamBuilder<int>(
        stream: null,
        builder: (context, snapshot) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .55,
                //height: MediaQuery.of(context).size.height * .8,
                child: cartProducts.totalItems == null
                    ? Container(
                        height: 25.0,
                        child: Text("No Items"),
                      )
                    : ListView.builder(
                      shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      itemCount: cartProducts.lineItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            OrderCard(
                              productName: cartProducts.lineItems[index].name,
                              quantity: cartProducts.lineItems[index].quantity,
                              productPrice: cartProducts
                                  .lineItems[index].price.raw
                                  .toString(),
                              productImage:
                                  cartProducts.lineItems[index].media.source,
                              productTotalPrice: cartProducts
                                  .lineItems[index].lineTotal.raw
                                  .toString(),
                              lineItemId: cartProducts.lineItems[index].id,
                            ),
                          ],
                        );
                      },
                    ),
                //bottomNavigationBar: _totalContainer(),
              ),
              _totalContainer()
            ],
          );
        }
      ),
    );
  }

  Widget _totalContainer() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      padding: EdgeInsets.only(
        left: Dimentions.padding16,
        right: Dimentions.padding16,
        top: Dimentions.padding10,
      ),
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cart Total : ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                cartProducts.subtotal.formatted.toString() +
                    ' ' +
                    cartProducts.currency.symbol,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          paddingBetweenText,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount : ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "0.0" + ' ' + cartProducts.currency.symbol,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          //paddingBetweenText,
          Divider(),
          //paddingBetweenText,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total : ',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                cartProducts.subtotal.formatted.toString() +
                    ' ' +
                    cartProducts.currency.symbol,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          paddingBetweenText,
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(35.0)),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed("SignInPage");
              },
              child: Text(
                "Proceed to Checkout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
