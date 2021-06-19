import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/constants.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/pages/homepage/components/ProductList.dart';
import 'package:go_food/src/pages/productDetails/components/RelatedProductsList.dart';
import 'package:go_food/src/pages/productDetails/components/relatedProductCard.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsPage extends StatefulWidget {
  String productImage;
  String productName;
  String productDescription;
  String productPrice;
  List<RelatedProducts> relatedProducts;
  List<VariantGroups> variantGroups;

  DetailsPage({
    this.productImage,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.relatedProducts,
    this.variantGroups,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
            backgroundColor: kPrimaryColor,
            //backgroundColor: Colors.transparent,
            elevation: 2,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * .35,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title: Text(
                widget.productName,
                style: TextStyle(
                  color: kPrimaryLightColor,
                ),
              ),
              background: Container(
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.productImage,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            //child: _buildContent(context),
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
                      Row(
                        children: [
                          Text('3.5 '),
                          starIcon(Colors.orange),
                        ],
                      ),
                      //Text('${starIcon(Colors.orange)}'+'3.5'), //Ratings
                    ],
                  ),

                  // Description
                  Padding(
                    padding: EdgeInsets.only(
                      top: Dimentions.padding16,
                    ),
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
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

                  //Related Product

                  Padding(
                    padding: EdgeInsets.only(
                      top: Dimentions.padding10,
                      bottom: Dimentions.padding10,
                    ),
                    child: Text(
                      'Related Products',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RelatedProductsList(
                            relatedProducts: widget.relatedProducts,
                          ) ==
                          null
                      ? Text("No Related Products")
                      : RelatedProductsList(
                          relatedProducts: widget.relatedProducts,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: addToCart(),
    );
  }

  Widget addToCart() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Icon starIcon(Color color) {
  return Icon(
    Icons.star,
    size: 10.0,
    color: color,
  );
}