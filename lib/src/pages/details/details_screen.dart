import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/widgets/ProductList.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsScreen extends StatefulWidget {
  String productImage;
  String productName;
  String productDescription;
  String productPrice;

  DetailsScreen(
      {this.productImage,
      this.productName,
      this.productDescription,
      this.productPrice});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var priceTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  var descriptionTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = "1"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      //appBar: CustomAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Icon(Icons.shopping_cart_outlined),
              SizedBox(
                width: 10.0,
              ),
              Icon(Icons.favorite),
              SizedBox(
                width: 10.0,
              ),
            ],
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * .35,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              /*title: Text(
                widget.productName,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),*/
              background: Image.network(
                widget.productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            //fillOverscroll: true,
            //child: _buildContent(context),
            child: Padding(
              padding: EdgeInsets.only(
                top: 0.0,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimentions.padding16,
                  right: Dimentions.padding16,
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productPrice == null
                              ? '\$\$\$'
                              : widget.productPrice,
                          style: priceTextStyle,
                        ),
                        Text("Ratings"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimentions.padding16,
                      ),
                      child: ExpandablePanel(
                        theme: ExpandableThemeData(
                          iconColor: Colors.blue,
                        ),
                        header: Text(
                          'Description',
                          style: descriptionTextStyle,
                        ),
                        expanded: Text(
                          widget.productDescription
                                      .replaceAll('<p>', '')
                                      .replaceAll('</p>', '\n') ==
                                  null
                              ? 'Food Description'
                              : widget.productDescription
                                  .replaceAll('<p>', '')
                                  .replaceAll('</p>', '\n'),
                          softWrap: true,
                        ),
                        collapsed: Text(
                          widget.productDescription
                                      .replaceAll('<p>', '')
                                      .replaceAll('</p>', '\n') ==
                                  null
                              ? 'Food Description'
                              : widget.productDescription
                                  .replaceAll('<p>', '')
                                  .replaceAll('</p>', '\n'),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*_buildContent(BuildContext context) {
  return SlidingUpPanel(
    maxHeight: MediaQuery.of(context).size.height * .8,
    minHeight: MediaQuery.of(context).size.height * .25,
    panel: Center(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the sliding Widget"),
          ),
        ],
      ),
    ),
  );
}*/
