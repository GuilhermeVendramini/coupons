import 'package:coupons/src/shared/colors/default_colors.dart';
import 'package:coupons/src/shared/languages/pt-br/strings.dart';
import 'package:flutter/cupertino.dart';

import '../../models/coupon/coupon_model.dart';
import 'coupon_display.dart';

class CouponHorizontalList extends StatelessWidget {
  final List<CouponModel> _coupons;

  CouponHorizontalList(this._coupons);

  final PageController _pageController = PageController(
    viewportFraction: 0.9,
  );

  @override
  Widget build(BuildContext context) {
    return _coupons != null && _coupons.length > 0
        ? PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: _coupons.length,
            itemBuilder: (BuildContext context, int index) {
              return CouponDisplay(_coupons[index]);
            },
          )
        : Container(
            child: Text(
              Strings.couponLoadError,
              style: TextStyle(color: DefaultColors.primary),
            ),
          );
  }
}
