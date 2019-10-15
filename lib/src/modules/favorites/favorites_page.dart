import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../shared/models/coupon/coupon_model.dart';
import '../../shared/widgets/coupon/coupon_vertical_list.dart';
import 'favorites_bloc.dart';
import 'widgets/empty_favorites_card.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<FavoritesProvider>(context);
    final List<CouponModel> _favoriteCoupons = _bloc.getFavoriteCoupons;
    return _favoriteCoupons.isEmpty
        ? EmptyFavoritesCard()
        : CouponVerticalList(_favoriteCoupons);
  }
}
