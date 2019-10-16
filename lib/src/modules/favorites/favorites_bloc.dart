import 'package:flutter/foundation.dart';

import '../../app_bloc.dart';
import '../../shared/models/coupon/coupon_model.dart';

class FavoritesBloc with ChangeNotifier {
  final AppProvider _appBloc;

  FavoritesBloc(this._appBloc);
}

class Favorites extends FavoritesBloc {
  Favorites(AppProvider appBloc) : super(appBloc);

  List<CouponModel> get getFavoriteCoupons {
    List<int> _favoriteCouponsID = _appBloc.getFavoriteCouponsID;
    List<CouponModel> _coupons = _appBloc.getCoupons;

    if (_coupons == null) return [];

    return _coupons
        .where((coupon) => _favoriteCouponsID.contains(coupon.id))
        .toList();
  }
}

class FavoritesProvider extends Favorites {
  FavoritesProvider(AppProvider appBloc) : super(appBloc) {
    deleteInvalidCoupons();
  }

  void deleteInvalidCoupons() {
    try {
      List<int> _favoriteCouponsID = _appBloc.getFavoriteCouponsID;
      List<CouponModel> _coupons = _appBloc.getCoupons;
      List<int> _invalidMyCoupons = _favoriteCouponsID.where((couponID) {
        if (_coupons.where((coupon) => coupon.id == couponID).length == 0)
          return true;
        return false;
      }).toList();

      if (_invalidMyCoupons != null && _invalidMyCoupons.length > 0) {
        _appBloc.getSqfliteCouponsRepository
            .deleteCoupons(couponsID: _invalidMyCoupons, table: 'favorites');
      }
    } catch (e) {
      print('FavoritesBloc - deleteInvalidCoupons(): $e');
    }
  }
}
