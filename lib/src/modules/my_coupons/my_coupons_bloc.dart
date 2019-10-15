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
  MyCouponsProvider(AppProvider appBloc) : super(appBloc);
}
