import 'package:flutter/cupertino.dart';

import '../../shared/colors/default_colors.dart';

class CouponPage extends StatefulWidget {
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: WillPopScope(
        onWillPop: () async {
          return Navigator.pop(context);
        },
        child: CupertinoPageScaffold(
          backgroundColor: DefaultColors.primary,
          child: SafeArea(
            child: Container(
              child: Text(
                'Interna',
                style: TextStyle(
                  color: CupertinoColors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
