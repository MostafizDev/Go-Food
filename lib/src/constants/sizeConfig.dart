import 'package:flutter/material.dart';

SizeConfig(BuildContext context, String position, double percent) {
  position == 'width'
      ? MediaQuery.of(context).size.width * percent
      : MediaQuery.of(context).size.height * percent;
}
