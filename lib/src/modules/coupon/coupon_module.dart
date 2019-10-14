import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import '../../repositories/sqflite/coupons/sqflite_coupons_repository.dart';
import '../../shared/models/coupon/coupon_model.dart';
import 'coupon_bloc.dart';
import 'coupon_page.dart';

class CouponModule extends StatelessWidget {
  final CouponModel _coupon;

  CouponModule(this._coupon);

  @override
  Widget build(BuildContext context) {
    final _appBloc = Provider.of<AppProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CouponProvider>(
          builder: (_) => CouponProvider(
            _appBloc,
            SqfliteCouponsRepository(),
          ),
        ),
      ],
      child: CouponPage(_coupon),
    );
  }
}
