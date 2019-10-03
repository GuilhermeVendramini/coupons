import 'package:coupons/src/shared/models/coupon/coupon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<HomeProvider>(context);
    return FutureBuilder<List<CouponModel>>(
      future: _bloc.loadCoupons(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CouponModel>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CupertinoActivityIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Text('Result: ${snapshot.data}');
        }
        return null;
      },
    );
  }
}
