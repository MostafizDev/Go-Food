import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Text(widget.variantProductName),
            Text(widget.variantProductPrice.replaceAll('.00', '')),
          ],
        ),
      ),
    );
  }
}
