import 'package:flutter/foundation.dart';

import '../../app_bloc.dart';
import '../../repositories/sqflite/coupons/sqflite_coupons_repository.dart';

class CouponBloc with ChangeNotifier {
  final AppProvider _appBloc;
  final SqfliteCouponsRepository _sqfliteCouponsRepository;

  CouponBloc(this._appBloc, this._sqfliteCouponsRepository);
}

class Coupon extends CouponBloc {
  Coupon(AppProvider appBloc, SqfliteCouponsRepository sqfliteCouponsRepository)
      : super(appBloc, sqfliteCouponsRepository);
}

class CouponProvider extends Coupon {
  CouponProvider(
      AppProvider appBloc, SqfliteCouponsRepository sqfliteCouponsRepository)
      : super(appBloc, sqfliteCouponsRepository);

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
      bool _result =
          await _sqfliteCouponsRepository.insertMyCoupon(couponID: couponID);
      if (_result) _appBloc.addToMyCoupons = couponID;

      notifyListeners();
    } catch (e) {
      print('CouponBloc - obtainCode(): $e');
    }
  }
}
