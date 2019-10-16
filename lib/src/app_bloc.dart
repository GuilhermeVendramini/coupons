import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

import 'repositories/lomadee/coupons/lomadee_coupons_repository.dart';
import 'repositories/sqflite/coupons/sqflite_coupons_repository.dart';
import 'shared/models/coupon/coupon_model.dart';

enum CouponsState { IDLE, LOADING, DONE }

class AppBloc with ChangeNotifier {
  final LomadeeCouponsRepository _lomadeeCouponsRepository;
  final SqfliteCouponsRepository _sqfliteCouponsRepository;

  AppBloc(this._lomadeeCouponsRepository, this._sqfliteCouponsRepository);

  final BehaviorSubject<List<CouponModel>> _coupons =
      BehaviorSubject<List<CouponModel>>();
  final BehaviorSubject<CouponsState> _couponsState =
      BehaviorSubject<CouponsState>();

  final BehaviorSubject<List<CouponModel>> _searchedCoupons =
      BehaviorSubject<List<CouponModel>>();

  List<int> _favoriteCoupons;
  List<int> _myCoupons;

  @override
  void dispose() {
    _searchedCoupons.close();
    _coupons.close();
    _couponsState.close();
    super.dispose();
  }
}

class App extends AppBloc {
  App(LomadeeCouponsRepository lomadeeCouponsRepository,
      SqfliteCouponsRepository sqfliteCouponsRepository)
      : super(lomadeeCouponsRepository, sqfliteCouponsRepository);

  List<CouponModel> get getCoupons {
    return _coupons.value;
  }

  Stream<List<CouponModel>> get getSearchedCoupons {
    return _searchedCoupons.stream;
  }

  List<int> get getFavoriteCouponsID {
    return _favoriteCoupons;
  }

  List<int> get getMyCouponsID {
    return _myCoupons;
  }

  SqfliteCouponsRepository get getSqfliteCouponsRepository {
    return _sqfliteCouponsRepository;
  }

  set addToMyCoupons(int couponID) {
    _myCoupons.add(couponID);
  }

  Stream<CouponsState> get getCouponsState {
    return _couponsState.stream;
  }
}

class AppProvider extends App {
  AppProvider(LomadeeCouponsRepository lomadeeCouponsRepository,
      SqfliteCouponsRepository sqfliteCouponsRepository)
      : super(lomadeeCouponsRepository, sqfliteCouponsRepository);

  Future<Null> loadCoupons() async {
    if (_couponsState.value == CouponsState.DONE) return null;
    _couponsState.add(CouponsState.LOADING);
    if (_coupons.value == null) {
      List<CouponModel> _result = await _lomadeeCouponsRepository
          .getCoupons()
          .timeout(Duration(seconds: 30), onTimeout: () {
        return [];
      });
      if (!_coupons.isClosed) {
        _coupons.add(_result);
        _searchedCoupons.add(_result);
        _coupons.close();
        _couponsState.add(CouponsState.DONE);
        _couponsState.close();
      }
    }
  }

  void searchCoupons(String search) {
    final _search = search.trim().toLowerCase();
    _searchedCoupons.value = _coupons.value
        .where((coupon) =>
            coupon.store.name.toLowerCase().contains(_search) ||
            coupon.description.toLowerCase().contains(_search) ||
            coupon.category.name.toLowerCase().contains(_search) ||
            coupon.discount.toString().contains(_search))
        .toList();
  }

  Future<Null> loadFavorites() async {
    if (_favoriteCoupons != null) {
      return null;
    }
    _favoriteCoupons = [];
    _favoriteCoupons = await _sqfliteCouponsRepository.favorites();
  }

  Future<Null> loadMyCoupons() async {
    if (_myCoupons != null) {
      return null;
    }
    _myCoupons = [];
    _myCoupons = await _sqfliteCouponsRepository.myCoupons();
  }

  Future<Null> toggleCouponFavorite({@required int couponID}) async {
    try {
      if (await isCouponFavorite(couponID: couponID)) {
        bool _result =
            await _sqfliteCouponsRepository.deleteFavorite(couponID: couponID);

        if (_result)
          _favoriteCoupons.removeWhere((coupon) => coupon == couponID);
      } else {
        bool _result =
            await _sqfliteCouponsRepository.insertFavorite(couponID: couponID);
        if (_result) _favoriteCoupons.add(couponID);
      }
      notifyListeners();
    } catch (e) {
      print('AppBloc - toggleCouponFavorite(): $e');
    }
  }

  Future<bool> isCouponFavorite({@required int couponID}) async {
    try {
      if (_favoriteCoupons.isEmpty) return false;

      int _result = _favoriteCoupons.firstWhere(
        (coupon) => coupon == couponID,
        orElse: () => null,
      );

      if (_result != null && _result > 0) {
        return true;
      }
      return false;
    } catch (e) {
      print('AppBloc - isCouponFavorite(): $e');
      return false;
    }
  }
}
