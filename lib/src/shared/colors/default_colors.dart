import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultColors {
  DefaultColors._();

  static const Color transparent = Color(0x00000000);
  static const Color red = Color.fromRGBO(236, 112, 99, 1);
  static const Color black = Color(0xFF000000);
  static final Color primary = Color.fromRGBO(241, 148, 138, 1);
  static final Color grey = Color.fromRGBO(128, 128, 128, 1);
  static final Color white = CupertinoColors.white;

  static MaterialColor colorByDiscount(double discount) {
    if (discount <= 10.0) {
      return Colors.amber;
    } else if (discount <= 20.0) {
      return Colors.orange;
    } else if (discount <= 30.0) {
      return Colors.red;
    } else if (discount <= 40.0) {
      return Colors.pink;
    } else if (discount <= 50.0) {
      return Colors.purple;
    } else if (discount <= 60.0) {
      return Colors.green;
    } else if (discount <= 70.0) {
      return Colors.cyan;
    } else if (discount <= 80.0) {
      return Colors.blue;
    } else if (discount <= 90.0) {
      return Colors.blueGrey;
    } else {
      return Colors.grey;
    }
  }
}
