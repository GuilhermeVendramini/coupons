import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'coupon_bloc.dart';
import 'coupon_page.dart';

class CouponModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CouponProvider>(
            builder: (_) => CouponProvider()),
      ],
      child: CouponPage(),
    );
  }
}
