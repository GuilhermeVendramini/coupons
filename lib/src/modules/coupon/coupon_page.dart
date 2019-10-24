import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/colors/default_colors.dart';
import '../../shared/models/coupon/coupon_model.dart';
import '../../shared/widgets/coupon/coupon_fields_display.dart';
import 'widgets/coupon_box.dart';

class CouponPage extends StatefulWidget {
  final CouponModel _coupon;

  CouponPage(this._coupon);

  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: WillPopScope(
        onWillPop: () async {
          return Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                DefaultColors.colorByDiscount(widget._coupon.discount).shade600,
                DefaultColors.colorByDiscount(widget._coupon.discount).shade200,
              ],
            ),
          ),
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(6.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: DefaultColors.black.withOpacity(0.1),
              ),
              child: CupertinoPageScaffold(
                backgroundColor: DefaultColors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      couponImage(
                        storeImage: widget._coupon.store.image,
                        storeName: widget._coupon.store.name,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      couponDescription(
                        description: widget._coupon.description,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      couponDiscount(
                        discount: widget._coupon.discount,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      couponCodeValidity(
                        vigency: widget._coupon.vigency,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      CouponBox(widget._coupon),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
