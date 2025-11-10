import 'package:flutter/widgets.dart';

double screenHeightPercentage(BuildContext context, double percent) {
  final height = MediaQuery.of(context).size.height;
  return height * (percent / 100);
}

double screenWidthPercentage(BuildContext context, double percent) {
  final width = MediaQuery.of(context).size.width;
  return width * (percent / 100);
}
