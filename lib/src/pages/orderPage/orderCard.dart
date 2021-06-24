import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final String productID;
  final String productName;
  final String productPrice;
  final int quantity;

  const OrderCard({
    Key key,
    this.productID,
    this.productName,
    this.productPrice,
    this.quantity,
  }) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {

  int cardItemCount;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "1"; // Setting the initial value for the field.

    print("Carrrrttttttttttttttttt");
    //_addToCart();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                          _controller.text =
                              (currentValue).toString(); // incrementing value
                          print(
                              "Controoooooooooooooollller  ::::::: ${_controller.text}");
                          //cardItemCount = _controller.text;

                          //widget.itemCount(int.parse(_controller.value.text));
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
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                        signed: true,
                      ),
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
                          print(
                              "Controoooooooooooooollller  ::::::: ${_controller.text}");
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
                    image: AssetImage("assets/images/lunch.jpeg"),
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
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                _controller.text,
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
                        Text("Chicken",
                            style: TextStyle(
                                color: Color(0xFFD3D3D3),
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "x",
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
            onTap: () {},
            child: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}