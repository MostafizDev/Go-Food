import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/constants/constants.dart';
import 'package:go_food/src/models/ProductsModel.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;
  final String categoryDescription;

  CategoryCard({this.categoryName, this.categoryDescription});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  /*ProductModel _productModel;

  _callProduct() async {
    try {
      _productModel = (await APIManager().getProducts()) as ProductModel;
      //print("Nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :::::::   ${_categories.data[1].name}");

      setState(() {});
    } catch (e) {
      print("Errroooooooooorrr : $e");
    }
  }
*//*
  @override
  void initState() {
    _callProduct();
    super.initState();
  }*/

  final cardTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      //shadowColor: kPrimaryLightColor,
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            widget.categoryName,
            style: cardTextStyle,
          ),
        ),
      ),
    );
  }
}
