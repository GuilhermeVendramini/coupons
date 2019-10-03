import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/models/coupon/coupon_model.dart';
import '../lomadee_config.dart';

class LomadeeCouponsRepository extends LomadeeConfig {
  Future<List<CouponModel>> getCoupons() async {
    http.Response _response;

    try {
      _response = await http.get(
        '$baseUrl$appToken/coupon/_all?sourceId=$sourceId',
        headers: {
          'Accept-Charset': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
      );

      if (_response.statusCode == 200 || _response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(_response.body);

        if (responseData.containsKey('coupons')) {
          List<CouponModel> _coupons = [];

          responseData['coupons'].forEach((couponData) {
            _coupons.add(CouponModel.fromJson(couponData));
          });

          return _coupons;
        }
      }

      return null;
    } catch (e) {
      print('LomadeeCouponsRepository - getCoupons(): $e');
      return null;
    }
  }
}
