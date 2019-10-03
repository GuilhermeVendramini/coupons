import 'package:flutter/foundation.dart';

import '../../repositories/lomadee/coupons/lomadee_coupons_repository.dart';
import '../../shared/models/coupon/coupon_model.dart';

class HomeBloc with ChangeNotifier {
  final LomadeeCouponsRepository _couponsRepository;

  HomeBloc(this._couponsRepository);

  List<CouponModel> _coupons;
}

class Home extends HomeBloc {
  Home(LomadeeCouponsRepository couponsRepository) : super(couponsRepository);

  List<CouponModel> get getCoupons {
    return _coupons;
  }
}

class HomeProvider extends Home {
  HomeProvider(LomadeeCouponsRepository couponsRepository)
      : super(couponsRepository);

  Future<List<CouponModel>> loadCoupons() async {
    if (_coupons != null && _coupons.isNotEmpty) {
      return _coupons;
    } else {
      _coupons = await _couponsRepository.getCoupons();
      return _coupons;
    }
  }
}
