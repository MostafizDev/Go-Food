import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/pages/homepage/components/ProductList.dart';
import 'package:go_food/src/widgets/boughtFood.dart';
import 'package:go_food/src/pages/homepage/components/foodCategory.dart';
import 'package:go_food/src/pages/homepage/components/homeTopInfo.dart';
import 'package:go_food/src/widgets/searchField.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height*.8,
      child: ListView(
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
