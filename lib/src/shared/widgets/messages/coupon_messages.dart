import 'package:coupons/src/shared/colors/default_colors.dart';
import 'package:coupons/src/shared/languages/pt-br/strings.dart';
import 'package:flutter/cupertino.dart';

final Color _textColor = DefaultColors.primary;

Widget messageCouponLoadError() {
  return Text(
    Strings.couponLoadError,
    style: TextStyle(
      color: _textColor,
    ),
  );
}

Widget messageCouponNotFound() {
  return Text(
    Strings.couponNotFound,
    style: TextStyle(
      color: _textColor,
    ),
  );
}
