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
        child: CupertinoPageScaffold(
          backgroundColor:
              DefaultColors.colorByDiscount(widget._coupon.discount),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
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
    );
  }
}
