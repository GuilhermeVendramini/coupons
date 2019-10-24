import 'package:flutter/cupertino.dart';

import '../../models/coupon/coupon_model.dart';
import '../messages/coupon_messages.dart';
import 'coupon_card.dart';

class CouponVerticalList extends StatelessWidget {
  final List<CouponModel> _coupons;

  CouponVerticalList(this._coupons);

  @override
  Widget build(BuildContext context) {
    return _coupons != null && _coupons.length > 0
        ? Container(
            margin: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.5,
                mainAxisSpacing: 20.0,
              ),
              itemCount: _coupons.length,
              itemBuilder: (BuildContext context, int index) {
                return CouponCard(_coupons[index]);
              },
            ),
          )
        : Container(
            child: messageCouponNotFound(),
          );
  }
}
