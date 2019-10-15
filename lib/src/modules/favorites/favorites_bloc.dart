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
  FavoritesProvider(AppProvider appBloc) : super(appBloc);
}
