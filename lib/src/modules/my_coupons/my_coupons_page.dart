import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../shared/models/coupon/coupon_model.dart';
import '../../shared/widgets/coupon/coupon_horizontal_list.dart';
import 'my_coupons_bloc.dart';
import 'widgets/empty_my_coupons_card.dart';

class MyCouponsPage extends StatefulWidget {
  @override
  _MyCouponsPageState createState() => _MyCouponsPageState();
}

class _MyCouponsPageState extends State<MyCouponsPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MyCouponsProvider>(context);
    final List<CouponModel> _favoriteCoupons = _bloc.getMyCoupons;
    return _favoriteCoupons.isEmpty
        ? EmptyMyCouponsCard()
        : CouponHorizontalList(_favoriteCoupons);
  }
}
