import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

ShimmerWidget(double height, double width, var itemCount, String type) {
  return Container(
    width: double.infinity,
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: type == 'itemList'
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                ),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            spreadRadius: 20)
                      ]),
                ),
              ),
              itemCount: itemCount,
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: itemCount,
                childAspectRatio: 1.5,
                //padding: const EdgeInsets.all(10),
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (_, __) => Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                ),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            spreadRadius: 20)
                      ]),
                ),
              ),
            ),
    ),
  );
}
