import 'package:flutter/foundation.dart';

import '../sqflite_connection.dart';

class SqfliteCouponsRepository extends SQFLiteConnection {
  Future<List<int>> favorites() async {
    final _db = await database;
    List<Map<String, dynamic>> _result = await _db.query('favorites');

    return _result.map<int>((it) => it['coupon_id']).toList();
  }

  Future<bool> delete({@required int couponID}) async {
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

  Future<bool> insert({@required int couponID}) async {
    final _db = await database;
    int _result = await _db.insert('favorites', {"coupon_id": couponID});

    if (_result != null && _result > 0) {
      return true;
    }

    return false;
  }
}
