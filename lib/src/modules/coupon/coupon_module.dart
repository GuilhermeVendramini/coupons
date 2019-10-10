import '../../shared/models/coupon/coupon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'coupon_bloc.dart';
import 'coupon_page.dart';

class CouponModule extends StatelessWidget {

  final CouponModel _coupon;

  CouponModule(this._coupon);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CouponProvider>(
            builder: (_) => CouponProvider()),
      ],
      child: CouponPage(_coupon),
    );
  }
}
