import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import '../../shared/widgets/coupon/coupon_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _appBloc = Provider.of<AppProvider>(context);
    return StreamBuilder<CouponsState>(
      initialData: CouponsState.IDLE,
      stream: _appBloc.getCouponsState,
      builder: (context, snapshot) {
        return Container(
          alignment: Alignment.center,
          child: snapshot.data == CouponsState.LOADING
              ? CupertinoActivityIndicator()
              : CouponList(_appBloc.getCoupons),
        );
      },
    );
  }
}
