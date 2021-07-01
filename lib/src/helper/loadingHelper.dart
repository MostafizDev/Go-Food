import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_food/src/constants/themes.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHelper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: Shimmer.fromColors(
                  baseColor: kPrimaryColor,
                  highlightColor: kPrimaryLightColor,
                  child: Card(
                    child: Container(
                      color: Colors.grey,
                      height: 50.0,
                      width: 50.0,

                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
