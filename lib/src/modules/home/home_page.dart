import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import '../../shared/models/coupon/coupon_model.dart';
import '../../shared/widgets/coupon/coupon_vertical_list.dart';
import '../../shared/widgets/messages/coupon_messages.dart';

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
              : StreamBuilder<List<CouponModel>>(
                  initialData: null,
                  stream: _appBloc.getSearchedCoupons,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                      case ConnectionState.done:
                        if (snapshot.hasError) return messageCouponLoadError();
                        if (snapshot.data == null)
                          return CupertinoActivityIndicator();
                        if (snapshot.data.length > 0)
                          return CouponVerticalList(snapshot.data);
                        return messageCouponNotFound();
                    }
                    return null;
                  },
                ),
        );
      },
    );
  }
}
