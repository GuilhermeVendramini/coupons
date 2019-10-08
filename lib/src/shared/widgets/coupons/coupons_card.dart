import 'package:flutter/cupertino.dart';

import '../../colors/default_colors.dart';
import '../../models/coupon/coupon_model.dart';

class CouponsCard extends StatelessWidget {
  final CouponModel _coupon;

  CouponsCard(this._coupon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tap');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: DefaultColors.colorByDiscount(_coupon.discount),
        ),
        margin: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _mainBox(),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _mainBox() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(),
            SizedBox(
              height: 20.0,
            ),
            _description(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DefaultColors.white.withOpacity(0.2),
          ),
        ),
      ),
      child: Text(
        _coupon.store.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
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
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _category() {
    return Text(
      _coupon.category.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _discount() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: DefaultColors.colorByDiscount(_coupon.discount),
      ),
      child: Text(
        '-${_coupon.discount.round().toString()}%',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            DefaultColors.white.withOpacity(0.1),
            DefaultColors.colorByDiscount(_coupon.discount),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _category(),
          _discount(),
        ],
      ),
    );
  }
}
