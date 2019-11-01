import 'package:coupons/src/app_bloc.dart';
import 'package:coupons/src/repositories/lomadee/coupons/lomadee_coupons_repository.dart';
import 'package:coupons/src/repositories/sqflite/coupons/sqflite_coupons_repository.dart';
import 'package:coupons/src/shared/models/coupon/coupon_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppBloc - AppProvider', () {
    final _bloc = AppProvider(
      LomadeeCouponsRepository(),
      SqfliteCouponsRepository(),
    );

    test('Load coupons - loadCoupons()', () async {
      await _bloc.loadCoupons();
      final List<CouponModel> _coupons = _bloc.getCoupons;

      expect(_coupons, isNotEmpty);
    });

    test('Toggle coupon favorite - toggleCouponFavorite()', () async {
      await _bloc.loadFavorites();
      final List<CouponModel> _coupons = _bloc.getCoupons;

      expect(_coupons, isNotEmpty);

      List<int> _favoriteCouponsID = _bloc.getFavoriteCouponsID;
      bool _isAlreadyFavorite = false;

      _isAlreadyFavorite =
          _favoriteCouponsID.where((id) => id == _coupons.first.id).length > 0;

      await _bloc.toggleCouponFavorite(couponID: _coupons.first.id);

      _favoriteCouponsID = _bloc.getFavoriteCouponsID;
      bool _isFavorite = false;

      if (_favoriteCouponsID.isNotEmpty) {
        _isFavorite =
            _favoriteCouponsID.where((id) => id == _coupons.first.id).length >
                0;
      }

      if (_isAlreadyFavorite) {
        print('Toggled to not favorite');
        expect(_isFavorite, false);
      } else {
        print('Toggled to favorite');
        expect(_isFavorite, true);
      }
    });
  });
}
