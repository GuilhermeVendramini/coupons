import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

import 'repositories/lomadee/coupons/lomadee_coupons_repository.dart';
import 'shared/models/coupon/coupon_model.dart';

enum CouponsState { IDLE, LOADING, DONE }

class AppBloc with ChangeNotifier {
  final LomadeeCouponsRepository _couponsRepository;

  AppBloc(this._couponsRepository);

  final BehaviorSubject<List<CouponModel>> _coupons =
      BehaviorSubject<List<CouponModel>>();
  final BehaviorSubject<CouponsState> _couponsState =
      BehaviorSubject<CouponsState>();

  @override
  void dispose() {
    _coupons.close();
    _couponsState.close();
    super.dispose();
  }
}

class App extends AppBloc {
  App(LomadeeCouponsRepository couponsRepository) : super(couponsRepository);

  List<CouponModel> get getCoupons {
    return _coupons.value;
  }

  Stream<CouponsState> get getCouponsState {
    return _couponsState.stream;
  }
}

class AppProvider extends App {
  AppProvider(LomadeeCouponsRepository couponsRepository)
      : super(couponsRepository);

  Future<Null> loadCoupons() async {
    if (_couponsState.value == CouponsState.DONE) return null;
    _couponsState.add(CouponsState.LOADING);
    if (_coupons.value == null || _coupons.value.isEmpty) {
      List<CouponModel> _result = await _couponsRepository.getCoupons();
      if (!_coupons.isClosed) {
        _coupons.add(_result);
        _coupons.close();
        _couponsState.add(CouponsState.DONE);
        _couponsState.close();
      }
    }
  }
}
