import 'package:flutter/material.dart';
import 'package:go_food/src/constants/constants.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/pages/productDetails/detailsPage.dart';
import 'package:go_food/src/widgets/customText.dart';

class RelatedProductsCard extends StatefulWidget {
  final String relatedProductName;
  final String relatedProductPrice;
  final String relatedProductImage;
  final String productName;
  final String productImage;
  final String productPriceWithSymbol;
  final String productPriceWithCode;
  final String productDescription;
  final String productCategory;
  final List<RelatedProducts> relatedProducts;
  final List<VariantGroups> variantGroups;

  const RelatedProductsCard({
    Key key,
    this.relatedProductName,
    this.relatedProductPrice,
    this.relatedProductImage,
    this.productName,
    this.productImage,
    this.productPriceWithSymbol,
    this.productPriceWithCode,
    this.productDescription,
    this.productCategory,
    this.relatedProducts,
    this.variantGroups,
  }) : super(key: key);

  @override
  _RelatedProductsCardState createState() => _RelatedProductsCardState();
}

class _RelatedProductsCardState extends State<RelatedProductsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      productImage: widget.productImage,
                      productName: widget.productName,
                      productDescription: widget.productDescription,
                      productPrice: widget.productPriceWithCode,
                      variantGroups: widget.variantGroups,
                      relatedProducts: widget.relatedProducts,
                    )),
          );*/
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  /*image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://cf.shopee.ph/file/6907c52b5698df501bf2fd83e803d6d2'),
                                ),*/
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.25),
                        offset: Offset(3, 2),
                        blurRadius: 15)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.relatedProductImage,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FractionalTranslation(
                translation: Offset(0, -0.5),
                child: Container(
                  width: 75,
                  height: 35,
                  child: Center(
                      child: Text(
                    widget.relatedProductPrice.replaceAll('.00', ''),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 5, color: Colors.white)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: CustomText(
                      text: "${widget.relatedProductName}",
                      size: 22,
                      weight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.add_shopping_cart, color: kPrimaryColor,),
                      onPressed: () {
                        //cartController.addProductToCart(product);
                      })
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
