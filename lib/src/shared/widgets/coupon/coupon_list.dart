import 'package:flutter/cupertino.dart';

import '../../models/coupon/coupon_model.dart';
import 'coupon_card.dart';

class CouponList extends StatelessWidget {
  final List<CouponModel> _coupons;

  CouponList(this._coupons);

  @override
  Widget build(BuildContext context) {
    return _coupons != null && _coupons.length > 0
        ? Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.5,
              ),
              itemCount: _coupons.length,
              itemBuilder: (BuildContext context, int index) {
                return CouponCard(_coupons[index]);
              },
            ),
          )
        : Container();
  }
}