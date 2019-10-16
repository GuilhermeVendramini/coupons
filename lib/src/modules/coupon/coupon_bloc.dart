import 'package:flutter/foundation.dart';

import '../../app_bloc.dart';

class CouponBloc with ChangeNotifier {
  final AppProvider _appBloc;

  CouponBloc(this._appBloc);
}

class Coupon extends CouponBloc {
  Coupon(AppProvider appBloc) : super(appBloc);
}

class CouponProvider extends Coupon {
  CouponProvider(AppProvider appBloc) : super(appBloc);

  Future<bool> couponAlreadyObtained({int couponID}) async {
    try {
      if (_appBloc.getMyCouponsID.isEmpty) return false;

      int _result = _appBloc.getMyCouponsID.firstWhere(
        (coupon) => coupon == couponID,
        orElse: () => null,
      );

      if (_result != null && _result > 0) {
        return true;
      }
      return false;
    } catch (e) {
      print('CouponBloc - couponAlreadyObtained(): $e');
      return false;
    }
  }

  Future<Null> obtainCode({@required int couponID}) async {
    try {
      bool _result = await _appBloc.getSqfliteCouponsRepository
          .insertMyCoupon(couponID: couponID);
      if (_result) _appBloc.addToMyCoupons = couponID;

      notifyListeners();
    } catch (e) {
      print('CouponBloc - obtainCode(): $e');
    }
  }
}
