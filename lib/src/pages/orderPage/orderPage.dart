import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/themes.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/deleteCartItem.dart';
import 'package:go_food/src/models/retrieveCartItem.dart';
import 'package:go_food/src/models/updateCartItem.dart';
import 'package:go_food/src/pages/orderPage/orderCard.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
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
  DeleteCartItem deleteCartItem = new DeleteCartItem();

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

  _updateCartItem(var itemId, var quantity) async {
    try {
      updateCartItem = await APIManager().updateCartItem(itemId, quantity);
      print("CART Item Id :::::::   ${updateCartItem.productId}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Updating Your Cart'),
        ),
      );
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }

  _deleteCartItem(var itemId, var quantity) async {
    try {
      updateCartItem = await APIManager().updateCartItem(itemId, quantity);
      print("CART Item Id :::::::   ${updateCartItem.productId}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          content: Loading(
              color: kPrimaryColor,
              indicator: BallPulseIndicator(),
              size: 75.0),
        ),
      );
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }

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
                cartProducts.lineItems == null
                    ? Container(
                        color: kPrimaryLightColor,
                        height: MediaQuery.of(context).size.height * .55,
                        child: Center(
                          child: Loading(
                              color: kPrimaryColor,
                              indicator: BallPulseIndicator(),
                              size: 75.0),
                        ),
                      )
                    : cartProducts.totalItems == 0
                        ? Container(
                            height: MediaQuery.of(context).size.height * .55,
                            //height: 25.0,
                            child: Center(
                                child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                "assets/images/empty-cart.png",
                                color: kPrimaryColor,
                              ),
                            )),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * .55,
                            //height: MediaQuery.of(context).size.height * .8,
                            child: ListView.builder(
                              shrinkWrap: true,
                              //scrollDirection: Axis.horizontal,
                              itemCount: cartProducts.lineItems.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    OrderCard(
                                      deletePtoduct: () async {
                                        await _deleteCartItem(
                                            cartProducts.lineItems[index].id,
                                            0);
                                        _callCartProduct();
                                      },
                                      itemCount: (value) async {
                                        await _updateCartItem(
                                            cartProducts.lineItems[index].id,
                                            value);
                                        _callCartProduct();
                                        print('Product Recalled');
                                      },
                                      productName:
                                          cartProducts.lineItems[index].name,
                                      quantity: cartProducts
                                          .lineItems[index].quantity,
                                      productPrice: cartProducts
                                          .lineItems[index].price.raw
                                          .toString(),
                                      productImage: cartProducts
                                          .lineItems[index].media.source,
                                      productTotalPrice: cartProducts
                                          .lineItems[index].lineTotal.raw
                                          .toString(),
                                      lineItemId:
                                          cartProducts.lineItems[index].id,
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
          }),
    );
  }

  Widget _totalContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: Dimentions.padding16,
        right: Dimentions.padding16,
        top: Dimentions.padding10,
      ),
      height: MediaQuery.of(context).size.height * .25,
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
                cartProducts.subtotal == null
                    ? '...'
                    : cartProducts.subtotal.formattedWithSymbol,
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
                'Tk0.00',
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
                cartProducts.subtotal == null
                    ? '...'
                    : cartProducts.subtotal.formattedWithSymbol.toString(),
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
