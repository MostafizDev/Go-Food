import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_food/src/constants/dimentions.dart';
import 'package:go_food/src/constants/sizeConfig.dart';
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
      height: MediaQuery.of(context).size.height * .8,
      //height: SizeConfig(context, "height", .8),
      child: AnimationLimiter(
        child: ListView(
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                )),
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
        ),
      ),
    );
  }
}
