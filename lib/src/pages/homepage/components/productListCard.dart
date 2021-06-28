import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/models/addToCart.dart';
import 'package:go_food/src/pages/productDetails/detailsPage.dart';
import 'package:go_food/src/pages/orderPage/orderCard.dart';

import '../../../widgets/customText.dart';
import 'package:get/get.dart';

class ProductListCard extends StatefulWidget {
  final String productID;
  final String productName;
  final String productImage;
  final String productPriceWithSymbol;
  final String productPriceWithCode;
  final String productDescription;
  final String productCategory;
  final List<RelatedProducts> relatedProducts;
  final List<VariantGroups> variantGroups;
  final ProductModel productModel;

  const ProductListCard({
    Key key,
    this.productID,
    this.productName,
    this.productImage,
    this.productPriceWithSymbol,
    this.productPriceWithCode,
    this.productDescription,
    this.productCategory,
    this.relatedProducts,
    this.variantGroups,
    this.productModel,
  }) : super(key: key);

  @override
  _ProductListCardState createState() => _ProductListCardState();
}

class _ProductListCardState extends State<ProductListCard> {
  AddToCart addToCart;
  final cardNameTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  final cardPriceTextStyle = TextStyle(fontSize: 10, color: Colors.orange);
  final cardDescriptionTextStyle = TextStyle(fontSize: 14, color: Colors.grey);

  Future _addToCart( ) async {
    try {
      addToCart = await APIManager().addToCart(widget.productID, 1.toString());
      //print("IIIIIIIIIIIIIIIDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD ::::: ${widget.productID}");
    //print("Nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :::::::   ${_productModel.data[0].name}");

    setState(() {});
    } catch (e) {
    print("Errroooooooooorrr : $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.25),
              offset: Offset(3, 2),
              blurRadius: 15)
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                productImage: widget.productImage,
                productName: widget.productName,
                productDescription: widget.productDescription,
                productPrice: widget.productPriceWithCode,
                variantGroups: widget.variantGroups,
                relatedProducts: widget.relatedProducts,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      widget.productImage,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Expanded(
              child: _detail(),
            ),
          ],
        ),
      ),
    );
  }

  _detail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: widget.productName,
            size: 18,
            weight: FontWeight.bold,
          ),
          /*CustomText(
            text: (widget.productDescription).replaceAll('<p>', '').replaceAll('</p>', ''),
            color: Colors.grey,
          ),*/
          Text(
            widget.productCategory == null
                ? 'Category'
                : widget.productCategory,
            //'Category',
            style: cardDescriptionTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: CustomText(
                  text: "${widget.productPriceWithSymbol}",
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    _addToCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to Cart'),
                      ),
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
