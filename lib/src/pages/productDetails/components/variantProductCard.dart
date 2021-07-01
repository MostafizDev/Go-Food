import 'package:flutter/material.dart';
import 'package:go_food/src/constants/themes.dart';

class VariantProductCard extends StatefulWidget {
  final String variantProductId;
  final String variantProductName;
  final String variantProductPrice;
  final String variantProductImage;
  final bool selected;

  const VariantProductCard({
    Key key,
    this.variantProductId,
    this.variantProductName,
    this.variantProductPrice,
    this.variantProductImage,
    this.selected,
  }) : super(key: key);

  @override
  _VariantProductCardState createState() => _VariantProductCardState();
}

class _VariantProductCardState extends State<VariantProductCard> {
  //bool cardSelected = false;
  var selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Card(
        elevation: widget.selected ? 2  : 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: widget.selected == false
                  ? kPrimaryLightColor
                  : kPrimaryColor,
              borderRadius: BorderRadius.circular(15.0)),
          width: 70.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.variantProductName),
              Text(widget.variantProductPrice.replaceAll('.00', '')),
            ],
          ),
        ),
      ),
    );
  }
}
