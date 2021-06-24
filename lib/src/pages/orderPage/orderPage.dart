import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/themes.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/retrieveCartItem.dart';
import 'package:go_food/src/pages/orderPage/orderCard.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  RetrieveCartItem cartProducts = new RetrieveCartItem();

  var paddingBetweenText = SizedBox(
    height: Dimentions.padding10,
  );

  _callCartProduct() async {
    try {
      cartProducts = await APIManager().getCartProducts();
      print(
          "CART     Nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :::::::   ${cartProducts.lineItems[0].productName}");

      setState(() {});
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }

  @override
  void initState() {
    _callCartProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          productPrice: cartProducts.lineItems[index].price.raw
                              .toString(),
                          productImage:
                              cartProducts.lineItems[index].media.source,
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

  Widget _totalContainer() {
    return Container(
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
                "Total : ",
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
