import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../shared/colors/default_colors.dart';
import '../../../shared/languages/pt-br/strings.dart';
import '../../../shared/models/coupon/coupon_model.dart';
import '../../../shared/widgets/coupon/coupon_fields_display.dart';
import '../coupon_bloc.dart';

class CouponBox extends StatefulWidget {
  final CouponModel _coupon;

  CouponBox(this._coupon);

  @override
  _CouponBoxState createState() => _CouponBoxState();
}

class _CouponBoxState extends State<CouponBox> {
  final Color _textColor = DefaultColors.white;

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CouponProvider>(context);
    return FutureBuilder<bool>(
      initialData: false,
      future: _bloc.couponAlreadyObtained(couponID: widget._coupon.id),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
          case ConnectionState.done:
            if (snapshot.hasError) return Container();
            return _fadeContainer(snapshot.data);
        }
        return null;
      },
    );
  }

  Widget _fadeContainer(bool data) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: data ? 1.0 : 0.0,
          child: data
              ? couponObtained(
                  context: context,
                  coupon: widget._coupon,
                )
              : Container(),
        ),
        data ? Container() : _obtainCode(),
      ],
    );
  }

  Widget _obtainCode() {
    final _bloc = Provider.of<CouponProvider>(context);
    return Material(
      color: DefaultColors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: DefaultColors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  DefaultColors.transparent,
                  DefaultColors.black.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10.0),
              color: DefaultColors.white,
            ),
            padding: EdgeInsets.all(20.0),
            child: Text(
              Strings.couponObtainCode.toUpperCase(),
              style: TextStyle(
                fontSize: 24.0,
                color: _textColor,
              ),
            ),
          ),
          onTap: () async {
            await _bloc.obtainCode(couponID: widget._coupon.id);
          },
        ),
      ),
    );
  }
}
