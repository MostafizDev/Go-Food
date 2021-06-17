import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/pages/homepage/components/ProductList.dart';
import 'package:go_food/src/widgets/boughtFood.dart';
import 'package:go_food/src/pages/homepage/components/foodCategory.dart';
import 'package:go_food/src/pages/homepage/components/homeTopInfo.dart';
import 'package:go_food/src/pages/homepage/components/search_file.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var paddingBetweenWidgets = SizedBox(
    height: Dimentions.padding10,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          left: Dimentions.padding16,
          right: Dimentions.padding16,
          top: Dimentions.padding16,
        ),
        children: [
          HomeTopInfo(),
          paddingBetweenWidgets,
          SearchField(),
          paddingBetweenWidgets,
          FoodCategory(),
          Divider(
            thickness: 1.0,
          ),
          paddingBetweenWidgets,
          ProductList(),
        ],
      ),
    );
  }

}
