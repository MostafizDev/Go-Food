import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:go_food/src/Services/APIClient.dart';
import 'package:go_food/src/helper/loadingHelper.dart';
import 'package:go_food/src/models/categoryModel.dart';
import 'package:go_food/src/widgets/shimmerAnimationWidget.dart';
import 'package:shimmer/shimmer.dart';

import 'categoryCard.dart';

class FoodCategory extends StatefulWidget {
  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  Category _categories;
  bool _enabled = true;

  //Future<NewsModel> _newsModel;

  _callCategory() async {
    try {
      _categories = await APIManager().getCategory();

      setState(() {});
    } catch (e) {
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
      height: 60.0,
      // width: 150.0,
      child: _categories == null
          ? ShimmerWidget(60.0, Get.width * .2, 6, 'itemList')
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories == null ? 0 : _categories.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  categoryName: _categories.data[index].name,
                  categoryDescription: _categories.data[index].description,
                );
              },
            ),
    );
  }
}
