import 'package:flutter/material.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/pages/details/details_screen.dart';
import 'package:go_food/src/widgets/orderCard.dart';

import 'customText.dart';

class ProductListCard extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productPriceWithSymbol;
  final String productPriceWithCode;
  final String productDescription;
  final String productCategory;
  final String relatedProducts;
  final ProductModel productModel;

  const ProductListCard({
    Key key,
    this.productName,
    this.productImage,
    this.productPriceWithSymbol,
    this.productPriceWithCode,
    this.productDescription,
    this.productCategory,
    this.relatedProducts,
    this.productModel,
  }) : super(key: key);

  @override
  _ProductListCardState createState() => _ProductListCardState();
}

class _ProductListCardState extends State<ProductListCard> {
  final cardNameTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  final cardPriceTextStyle = TextStyle(fontSize: 10, color: Colors.orange);
  final cardDescriptionTextStyle = TextStyle(fontSize: 14, color: Colors.grey);

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
                builder: (context) => DetailsScreen(
                      productImage: widget.productImage,
                      productName: widget.productName,
                      productDescription: widget.productDescription,
                      productPrice: widget.productPriceWithCode,
                    )),
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

  Icon starIcon(Color color) {
    return Icon(
      Icons.star,
      size: 10.0,
      color: color,
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
            //widget.productCategory == null ? 'Category' : widget.productCategory,
            'Category',
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
                    //cartController.addProductToCart(product);
                  })
            ],
          ),
        ],
      ),
    );
  }
}