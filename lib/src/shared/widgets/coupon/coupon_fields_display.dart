import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../colors/default_colors.dart';
import '../../languages/pt-br/strings.dart';
import '../../models/coupon/coupon_model.dart';

final Color _textColor = DefaultColors.white;

Widget couponObtained({
  @required BuildContext context,
  @required CouponModel coupon,
  double fontSize,
}) {
  return Column(
    children: <Widget>[
      couponCodeTitle(),
      SizedBox(
        height: 10.0,
      ),
      couponCode(code: coupon.code, fontSize: fontSize),
      SizedBox(
        height: 40.0,
      ),
      couponRedeem(context: context, coupon: coupon),
    ],
  );
}

Widget couponCodeTitle() {
  return Text(
    Strings.couponCodeTitle.toUpperCase(),
    style: TextStyle(
      color: _textColor,
      fontWeight: FontWeight.w300,
    ),
  );
}

Widget couponCode({@required String code, double fontSize = 28.0}) {
  return Wrap(
    alignment: WrapAlignment.center,
    spacing: 10.0,
    runSpacing: 10.0,
    children: <Widget>[
      Text(
        code,
        style: TextStyle(
          color: _textColor,
          fontSize: fontSize,
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
              Clipboard.setData(ClipboardData(text: code));
            },
          ),
        ),
      )
    ],
  );
}

Widget couponRedeem(
    {@required BuildContext context, @required CouponModel coupon}) {
  final Color _couponColor = DefaultColors.colorByDiscount(coupon.discount);

  return Material(
    color: DefaultColors.transparent,
    child: Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: DefaultColors.black.withOpacity(0.1),
          ),
          child: Text(
            Strings.couponRedeem.toUpperCase(),
            style: TextStyle(
              color: _textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onTap: () {
          final _flutterWebviewPlugin = new FlutterWebviewPlugin();

          Clipboard.setData(ClipboardData(text: coupon.code));

          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => Container(
                color: _couponColor,
                child: SafeArea(
                  child: WebviewScaffold(
                    appBar: CupertinoNavigationBar(
                      previousPageTitle: Strings.appName,
                      middle: Text(
                        coupon.code,
                        style: TextStyle(
                          color: _couponColor,
                        ),
                      ),
                    ),
                    withLocalStorage: true,
                    appCacheEnabled: true,
                    withZoom: true,
                    withJavascript: true,
                    clearCookies: false,
                    clearCache: false,
                    initialChild: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    url: coupon.link,
                  ),
                ),
              ),
            ),
          );
          _flutterWebviewPlugin.onDestroy.listen((_) {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
              _flutterWebviewPlugin.dispose();
              _flutterWebviewPlugin.cleanCookies();
            }
          });
        },
      ),
    ),
  );
}

Widget couponDescription({@required String description}) {
  return Text(
    description,
    style: TextStyle(
      color: _textColor,
    ),
    textAlign: TextAlign.center,
  );
}

Widget couponImage({@required String storeImage, @required String storeName}) {
  return Container(
    height: 120.0,
    child: CachedNetworkImage(
      imageUrl: storeImage,
      placeholder: (context, url) => CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => Text(
        storeName,
        style: TextStyle(
          fontSize: 36.0,
          color: _textColor,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

Widget couponDiscount({@required double discount, double fontSize = 24.0}) {
  return Container(
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: DefaultColors.white.withOpacity(0.1),
    ),
    child: Text(
      '-$discount%',
      style: TextStyle(
        fontSize: fontSize,
        color: _textColor,
      ),
    ),
  );
}

Widget couponCodeValidity({@required String vigency}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        Strings.couponCodeValidity,
        style: TextStyle(
          fontSize: 12.0,
          color: _textColor,
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
      Text(
        vigency,
        style: TextStyle(
          fontSize: 12.0,
          color: _textColor,
        ),
      ),
    ],
  );
}
