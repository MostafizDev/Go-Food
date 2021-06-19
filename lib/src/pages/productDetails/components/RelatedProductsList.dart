import 'package:flutter/material.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/pages/productDetails/components/relatedProductCard.dart';

class RelatedProductsList extends StatefulWidget {
  final List<RelatedProducts> relatedProducts;

  const RelatedProductsList({Key key, this.relatedProducts}) : super(key: key);

  @override
  _RelatedProductsListState createState() => _RelatedProductsListState();
}

class _RelatedProductsListState extends State<RelatedProductsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.relatedProducts.length,
        itemBuilder: (context, index) {
          return RelatedProductsCard(
            relatedProductName: widget.relatedProducts[index].name,
            relatedProductPrice:
                widget.relatedProducts[index].price.formattedWithCode,
            relatedProductImage: widget.relatedProducts[index].media.source,
          );
        },
      ),
    );
  }
}
