import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/colors/default_colors.dart';
import '../../shared/languages/pt-br/strings.dart';
import '../../shared/models/coupon/coupon_model.dart';

class CouponPage extends StatefulWidget {
  final CouponModel _coupon;

  CouponPage(this._coupon);

  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  final Color _textColor = DefaultColors.white;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: WillPopScope(
        onWillPop: () async {
          return Navigator.pop(context);
        },
        child: CupertinoPageScaffold(
          backgroundColor:
              DefaultColors.colorByDiscount(widget._coupon.discount),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _image(),
                    SizedBox(
                      height: 40.0,
                    ),
                    _description(),
                    SizedBox(
                      height: 40.0,
                    ),
                    _discount(),
                    SizedBox(
                      height: 40.0,
                    ),
                    _obtainCode(),
                    _couponBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _couponBox() {
    return Column(
      children: <Widget>[
        _codeTitle(),
        SizedBox(
          height: 10.0,
        ),
        _code(),
      ],
    );
  }

  Widget _description() {
    return Text(
      widget._coupon.description,
      style: TextStyle(
        color: _textColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _image() {
    return Container(
      padding: EdgeInsets.all(4.0),
      color: DefaultColors.black.withOpacity(0.1),
      child: CachedNetworkImage(
        imageUrl: widget._coupon.store.image,
        placeholder: (context, url) => CupertinoActivityIndicator(),
        errorWidget: (context, url, error) => Text(
          widget._coupon.store.name,
          style: TextStyle(
            fontSize: 36.0,
            color: _textColor,
          ),
        ),
      ),
    );
  }

  Widget _discount() {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: DefaultColors.white.withOpacity(0.1),
      ),
      child: Text(
        '-${widget._coupon.discount}%',
        style: TextStyle(
          fontSize: 24.0,
          color: _textColor,
        ),
      ),
    );
  }

  Widget _codeTitle() {
    return Text(
      Strings.couponCodeTitle.toUpperCase(),
      style: TextStyle(
        color: _textColor,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _obtainCode() {
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
          onTap: () {},
        ),
      ),
    );
  }

  Widget _code() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10.0,
      runSpacing: 10.0,
      children: <Widget>[
        Text(
          widget._coupon.code,
          style: TextStyle(
            color: _textColor,
            fontSize: 28.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.0,
          ),
        ),
        Material(
          color: DefaultColors.transparent,
          child: Ink(
            child: InkWell(
              borderRadius: BorderRadius.circular(40.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: DefaultColors.black.withOpacity(0.1),
                ),
                child: Text(
                  Strings.couponCodeCopy.toUpperCase(),
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              onTap: () {
                Clipboard.setData(ClipboardData(text: widget._coupon.code));
              },
            ),
          ),
        )
      ],
    );
  }
}
