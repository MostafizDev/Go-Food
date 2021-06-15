import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/models/ProductsModel.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;
  final String categoryDescription;

  CategoryCard({this.categoryName, this.categoryDescription});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  ProductModel _productModel;

  _callProduct() async {
    try{
      _productModel = (await APIManager().getProducts()) as ProductModel;
      //print("Nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :::::::   ${_categories.data[1].name}");

      setState(() {

      });
    }catch (e){
      print("Errroooooooooorrr : $e");
    }

  }
  @override
  void initState() {
    _callProduct();
    super.initState();
  }

  final cardTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            SizedBox(width: 20.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.categoryName, style: cardTextStyle,),
                Text(widget.categoryDescription, style: cardTextStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
