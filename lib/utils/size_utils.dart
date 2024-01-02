import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizeUtils {
  static SizedBox sH(double height) => SizedBox(height: height.h);

  static SizedBox sW(double width) => SizedBox(width: width.w);
}
/// USING THIS ANOTHER SCREEN ///
/// SizeUtils.sH(10.0), Creates a SizedBox with a height of 10% of the screen height ///
/// SizeUtils.sW(20.0),  Creates a SizedBox with a width of 20% of the ///