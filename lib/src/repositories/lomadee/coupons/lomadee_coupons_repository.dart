import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../../shared/models/coupon/coupon_model.dart';
import '../lomadee_config.dart';

class LomadeeCouponsRepository {
  static DioCacheManager _dioCacheManager = DioCacheManager(
    CacheConfig(
      baseUrl: '${LomadeeConfig.baseUrl}${LomadeeConfig.appToken}/',
    ),
  );

  Future<List<CouponModel>> getCoupons() async {
    Response _response;

    try {
      Dio _dio = Dio(
        BaseOptions(
          baseUrl: '${LomadeeConfig.baseUrl}${LomadeeConfig.appToken}/',
          contentType: "application/x-www-form-urlencoded; charset=utf-8",
        ),
      )..interceptors.add(_dioCacheManager.interceptor);

      _response = await _dio.get(
        'coupon/_all?sourceId=${LomadeeConfig.sourceId}',
        options: buildCacheOptions(
          Duration(hours: 1),
        ),
      );

      if (_response.statusCode == 200 || _response.statusCode == 201) {
        if (_response.data.containsKey('coupons')) {
          List<CouponModel> _coupons = [];

          _response.data['coupons'].forEach((couponData) {
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
