import 'package:flutter/cupertino.dart';

import '../../colors/default_colors.dart';
import '../../models/coupon/coupon_model.dart';

class CouponsCard extends StatelessWidget {
  final CouponModel _coupon;

  CouponsCard(this._coupon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: DefaultColors.grey,
      ),
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(20.0),
      child: Text(
        _coupon.store.name,
        style: TextStyle(
          color: DefaultColors.white,
          fontSize: 36.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
