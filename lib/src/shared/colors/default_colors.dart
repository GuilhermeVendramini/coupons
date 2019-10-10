import 'package:flutter/cupertino.dart';

class DefaultColors {
  DefaultColors._();

  static const Color transparent = Color(0x00000000);
  static const Color red = Color.fromRGBO(241, 138, 138, 1);
  static const Color black = Color(0xFF000000);
  static final Color primary = Color.fromRGBO(241, 148, 138, 1);
  static final Color grey = Color.fromRGBO(128, 128, 128, 1);
  static final Color white = CupertinoColors.white;

  static Color colorByDiscount(double discount) {
    if (discount <= 10.0) {
      return Color.fromRGBO(229, 152, 102, 1);
    } else if (discount <= 20.0) {
      return Color.fromRGBO(125, 206, 160, 1);
    } else if (discount <= 30.0) {
      return Color.fromRGBO(115, 198, 182, 1);
    } else if (discount <= 40.0) {
      return Color.fromRGBO(133, 193, 233, 1);
    } else if (discount <= 50.0) {
      return Color.fromRGBO(127, 179, 213, 1);
    } else if (discount <= 60.0) {
      return Color.fromRGBO(169, 204, 227, 1);
    } else if (discount <= 70.0) {
      return Color.fromRGBO(210, 180, 222, 1);
    } else if (discount <= 80.0) {
      return Color.fromRGBO(175, 122, 197, 1);
    } else if (discount <= 90.0) {
      return Color.fromRGBO(112, 123, 124, 1);
    } else {
      return Color.fromRGBO(52, 73, 94, 1);
    }
  }
}
