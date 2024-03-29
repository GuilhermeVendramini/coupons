import 'package:flutter/cupertino.dart';

import '../../colors/default_colors.dart';
import '../../models/coupon/coupon_model.dart';
import 'coupon_fields_display.dart';

class CouponDisplay extends StatelessWidget {
  final CouponModel _coupon;

  CouponDisplay(this._coupon);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            DefaultColors.colorByDiscount(_coupon.discount).shade600,
            DefaultColors.colorByDiscount(_coupon.discount).shade200,
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: DefaultColors.black.withOpacity(0.1),
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              couponImage(
                storeImage: _coupon.store.image,
                storeName: _coupon.store.name,
              ),
              SizedBox(
                height: 20.0,
              ),
              couponDescription(
                description: _coupon.description,
              ),
              SizedBox(
                height: 20.0,
              ),
              couponDiscount(
                discount: _coupon.discount,
                fontSize: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              couponCodeValidity(
                vigency: _coupon.vigency,
              ),
              SizedBox(
                height: 20.0,
              ),
              couponObtained(
                context: context,
                coupon: _coupon,
                fontSize: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
