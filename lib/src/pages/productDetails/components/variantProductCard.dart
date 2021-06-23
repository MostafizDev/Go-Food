import 'package:flutter/material.dart';
import 'package:go_food/src/constants/themes.dart';

class VariantProductCard extends StatefulWidget {
  final String variantProductName;
  final String variantProductPrice;
  final String variantProductImage;

  const VariantProductCard({
    Key key,
    this.variantProductName,
    this.variantProductPrice,
    this.variantProductImage,
  }) : super(key: key);

  @override
  _VariantProductCardState createState() => _VariantProductCardState();
}

class _VariantProductCardState extends State<VariantProductCard> {
  bool cardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              setState(() {
                cardSelected = !cardSelected;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: cardSelected == false
                      ? kPrimaryLightColor
                      : kPrimaryColor,
                  borderRadius: BorderRadius.circular(15.0)),
              width: 65.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.variantProductName),
                  Text(widget.variantProductPrice.replaceAll('.00', '')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
