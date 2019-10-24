import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../modules/coupon/coupon_module.dart';
import '../../colors/default_colors.dart';
import '../../models/coupon/coupon_model.dart';
import 'coupon_favorite.dart';

class CouponCard extends StatelessWidget {
  final CouponModel _coupon;

  CouponCard(this._coupon);

  final _textColor = DefaultColors.white;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              DefaultColors.colorByDiscount(_coupon.discount).shade400,
              DefaultColors.colorByDiscount(_coupon.discount).shade600,
            ],
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => CouponModule(_coupon)),
            );
          },
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _mainBox(),
                _footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainBox() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(),
            SizedBox(
              height: 20.0,
            ),
            _description(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DefaultColors.white.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _title(),
          CouponFavorite(this._coupon.id),
        ],
      ),
    );
  }

  Widget _title() {
    return Flexible(
      child: Text(
        _coupon.store.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: _textColor,
          fontSize: 36.0,
        ),
      ),
    );
  }

  Widget _description() {
    return Text(
      _coupon.description,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: TextStyle(
        color: _textColor,
      ),
    );
  }

  Widget _category() {
    return Text(
      _coupon.category.name,
      style: TextStyle(
        color: _textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _discount() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: DefaultColors.white.withOpacity(0.2),
      ),
      child: Text(
        '-${_coupon.discount.round().toString()}%',
        style: TextStyle(
          color: _textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _category(),
        _discount(),
      ],
    );
  }
}
