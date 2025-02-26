import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screenadapter {
  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static height(double value) {
    return ScreenUtil().setWidth(value);
  }

  static screenWidth() {
    return ScreenUtil().screenWidth;
  }
}