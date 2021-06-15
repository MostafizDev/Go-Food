import 'package:flutter/material.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/models/categoryModel.dart';

import 'categoryCard.dart';

class FoodCategory extends StatefulWidget {
  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  Category _categories;

  //Future<NewsModel> _newsModel;

  _callCategory() async {
    try{
      _categories = await APIManager().getCategory();
      print("Nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :::::::   ${_categories.data[1].name}");

      setState(() {

      });
    }catch (e){
      print("Errroooooooooorrr : $e");
    }

  }
  @override
  void initState() {
    _callCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories == null ? 0 : _categories.data.length,
        itemBuilder: (BuildContext context, int index){
          return CategoryCard(
            categoryName: _categories.data[index].name,
            categoryDescription: _categories.data[index].description,
          );
        },
      ),
    );
  }
}
