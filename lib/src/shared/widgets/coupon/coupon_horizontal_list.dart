import 'package:coupons/src/shared/colors/default_colors.dart';
import 'package:coupons/src/shared/languages/pt-br/strings.dart';
import 'package:flutter/cupertino.dart';

import '../../models/coupon/coupon_model.dart';

class CouponHorizontalList extends StatelessWidget {
  final List<CouponModel> _coupons;

  CouponHorizontalList(this._coupons);

  @override
  Widget build(BuildContext context) {
    return _coupons != null && _coupons.length > 0
        ? Container(
            height: 200.0,
            child: ListView.builder(
              itemCount: _coupons.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(_coupons[index].store.name);
              },
            ),
          )
        : Container(
            child: Text(
              Strings.couponLoadError,
              style: TextStyle(color: DefaultColors.primary),
            ),
          );
  }
}
