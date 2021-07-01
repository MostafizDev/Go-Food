import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/themes.dart';
import 'package:go_food/src/models/ProductsModel.dart';
import 'package:go_food/src/pages/productDetails/components/variantProductCard.dart';
import 'package:item_selector/item_selector.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

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
      child: ItemSelectionController(
        child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.variantsProduct.length,
                itemBuilder: (context, index) {
                  return ItemSelectionBuilder(
                      index: index,
                      builder:
                          (BuildContext context, int index, bool selected) {
                        return VariantProductCard(
                          variantProductId: widget.variantsProduct[index].id,
                          variantProductName:
                              widget.variantsProduct[index].name,
                          variantProductPrice: widget.variantsProduct[index]
                              .options[0].price.formattedWithCode,
                          selected: selected,
                        );
                      });
                },
              ),
      ),
    );
  }
}
