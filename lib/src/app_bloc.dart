import 'package:flutter/foundation.dart';

import 'repositories/lomadee/coupons/lomadee_coupons_repository.dart';
import 'shared/models/coupon/coupon_model.dart';

enum CouponsState { IDLE, LOADING, DONE }

class AppBloc with ChangeNotifier {
  final LomadeeCouponsRepository _couponsRepository;

  AppBloc(this._couponsRepository);

  List<CouponModel> _coupons;
  CouponsState _couponsState = CouponsState.IDLE;
}

class App extends AppBloc {
  App(LomadeeCouponsRepository couponsRepository) : super(couponsRepository);

  List<CouponModel> get getCoupons {
    return _coupons;
  }

  CouponsState get getCouponsState {
    return _couponsState;
  }
}

class AppProvider extends App {
  AppProvider(LomadeeCouponsRepository couponsRepository)
      : super(couponsRepository);

  Future<Null> loadCoupons() async {
    if (_couponsState == CouponsState.DONE) return null;
    _couponsState = CouponsState.LOADING;
    if (_coupons == null || _coupons.isEmpty) {
      _coupons = await _couponsRepository.getCoupons();
      _couponsState = CouponsState.DONE;
      notifyListeners();
    }
  }
}
