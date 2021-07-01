import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/deleteCartItem.dart';
import 'package:go_food/src/models/retrieveCartItem.dart';
import 'package:go_food/src/models/updateCartItem.dart';
import 'package:go_food/src/pages/orderPage/orderPage.dart';

// ignore: must_be_immutable
typedef ItemCount = Function(String);

class OrderCard extends StatefulWidget {
  String productID;
  String productName;
  String productImage;
  String productPrice;
  String productTotalPrice;
  String lineItemId;
  String deleteItemId;
  String cartTotalPrice;
  String currencyType;
  int quantity;
  ItemCount itemCount;
  VoidCallback deletePtoduct;

  OrderCard({
    this.productID,
    this.productPrice,
    this.quantity,
    this.productName,
    this.productTotalPrice,
    this.lineItemId,
    this.deleteItemId,
    this.cartTotalPrice,
    this.currencyType,
    this.productImage,
    this.itemCount,
    this.deletePtoduct,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  RetrieveCartItem cartProducts = new RetrieveCartItem();
  UpdateCartItem updateCartItem = new UpdateCartItem();
  DeleteCartItem deleteCartItem = new DeleteCartItem();
  TextEditingController _controller = TextEditingController();
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
      //print("CART Item Id :::::::   ${updateCartItem.productId}");

      setState(() {});
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }

  _deleteCartItem(var itemId) async {
    try {
      deleteCartItem = await APIManager().deleteCartItem(itemId);
      print("Deleted Cart Product Id ::: ${deleteCartItem.lineItemId}");

      setState(() {});
    } catch (e) {
      print("Deleted Cart Error : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.quantity
        .toString(); // Setting the initial value for Product item.
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Row(
            children: [
              Container(
                width: 40.0,
                height: 75.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            int currentValue = int.parse(_controller.text);
                            setState(() {
                              currentValue++;
                              _controller.text = (currentValue)
                                  .toString(); // incrementing value

                              widget.itemCount(_controller.text);
                              print("Controller  ::::::: ${_controller.text}");

                              /*widget.productTotalPrice =
                                  updateCartItem.lineTotal.raw.toString();*/
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_up,
                              color: Color(0xFFD3D3D3))),
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _controller,
                          style: TextStyle(fontSize: 18.0, color: Colors.grey),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            int currentValue = int.parse(_controller.text);
                            setState(() {
                              print("Setting state");
                              currentValue--;
                              _controller.text =
                                  (currentValue > 0 ? currentValue : 0)
                                      .toString(); // decrementing value
                              widget.itemCount(_controller.text);
                              print("Controller  ::::::: ${_controller.text}");
                              /*widget.productTotalPrice =
                                  updateCartItem.lineTotal.raw.toString();*/
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xFFD3D3D3))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.productImage,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(35.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 2.0))
                    ]),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.productName,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    widget.productTotalPrice,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    height: 25.0,
                    width: 120.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("",
                                style: TextStyle(
                                    color: Color(0xFFD3D3D3),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: widget.deletePtoduct,
                child: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
