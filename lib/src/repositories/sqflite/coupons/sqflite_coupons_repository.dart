import 'package:flutter/foundation.dart';

import '../sqflite_connection.dart';

class SqfliteCouponsRepository extends SQFLiteConnection {
  Future<List<int>> favorites() async {
    final _db = await database;
    List<Map<String, dynamic>> _result = await _db.query('favorites');

    return _result.map<int>((it) => it['coupon_id']).toList();
  }

  Future<bool> deleteFavorite({@required int couponID}) async {
    final _db = await database;
    int _result = await _db.delete(
      'favorites',
      where: 'coupon_id = ?',
      whereArgs: [couponID],
    );

    if (_result != null && _result > 0) {
      return true;
    }

    return false;
  }

  Future<bool> insertFavorite({@required int couponID}) async {
    final _db = await database;
    int _result = await _db.insert('favorites', {"coupon_id": couponID});

    if (_result != null && _result > 0) {
      return true;
    }

    return false;
  }

  Future<List<int>> myCoupons() async {
    final _db = await database;
    List<Map<String, dynamic>> _result = await _db.query('my_coupons');

    return _result.map<int>((it) => it['coupon_id']).toList();
  }

  Future<bool> deleteMyCoupon({@required int couponID}) async {
    final _db = await database;
    int _result = await _db.delete(
      'my_coupons',
      where: 'coupon_id = ?',
      whereArgs: [couponID],
    );

    if (_result != null && _result > 0) {
      return true;
    }

    return false;
  }

  Future<bool> deleteCoupons(
      {@required List<int> couponsID, @required String table}) async {
    final _db = await database;
    int _result = await _db.rawDelete(
        "DELETE from $table WHERE coupon_id IN (${couponsID.join(',')})");

    if (_result != null && _result > 0) {
      return true;
    }

    return false;
  }

  Future<bool> insertMyCoupon({@required int couponID}) async {
    final _db = await database;
    int _result = await _db.insert('my_coupons', {"coupon_id": couponID});

    if (_result != null && _result > 0) {
      return true;
    }

    return false;
  }
}
