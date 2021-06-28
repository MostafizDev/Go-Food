import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/pages/productDetails/components/variantProductCard.dart';

class VariantGroupsList extends StatefulWidget {
  final List<VariantGroups> variantsProduct;

  const VariantGroupsList({Key key, this.variantsProduct}) : super(key: key);

  @override
  _VariantGroupsListState createState() => _VariantGroupsListState();
}

class _VariantGroupsListState extends State<VariantGroupsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      //color: Colors.greenAccent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.variantsProduct.length,
        itemBuilder: (context, index) {
          return VariantProductCard(
            variantProductId: widget.variantsProduct[index].id,
            variantProductName: widget.variantsProduct[index].name,
            variantProductPrice: widget.variantsProduct[index].options[0].price.formattedWithCode,
          );
        },
      ),
    );
  }
}
