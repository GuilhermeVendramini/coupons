import 'package:flutter/foundation.dart';

import '../../app_bloc.dart';
import '../../shared/models/coupon/coupon_model.dart';

class MyCouponsBloc with ChangeNotifier {
  final AppProvider _appBloc;

  MyCouponsBloc(this._appBloc);
}

class MyCoupons extends MyCouponsBloc {
  MyCoupons(AppProvider appBloc) : super(appBloc);

  List<CouponModel> get getMyCoupons {
    List<int> _myCouponsID = _appBloc.getMyCouponsID;
    List<CouponModel> _coupons = _appBloc.getCoupons;

    if (_coupons == null) return [];

    return _coupons
        .where((coupon) => _myCouponsID.contains(coupon.id))
        .toList();
  }
}

class MyCouponsProvider extends MyCoupons {
  MyCouponsProvider(AppProvider appBloc) : super(appBloc) {
    deleteInvalidCoupons();
  }

  void deleteInvalidCoupons() {
    try {
      List<int> _myCouponsID = _appBloc.getMyCouponsID;
      List<CouponModel> _coupons = _appBloc.getCoupons;

      List<int> _invalidMyCoupons = _myCouponsID.where((couponID) {
        if (_coupons.where((coupon) => coupon.id == couponID).length == 0)
          return true;
        return false;
      }).toList();

      if (_invalidMyCoupons != null && _invalidMyCoupons.length > 0) {
        _appBloc.getSqfliteCouponsRepository
            .deleteCoupons(couponsID: _invalidMyCoupons, table: 'my_coupons');
      }
    } catch (e) {
      print('MyCouponsBloc - deleteInvalidCoupons(): $e');
    }
  }
}
