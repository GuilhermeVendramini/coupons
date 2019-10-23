import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../app_bloc.dart';
import '../../colors/default_colors.dart';

class CouponFavorite extends StatelessWidget {
  final int _couponID;

  CouponFavorite(this._couponID);

  final Icon _favoriteIcon = Icon(
    CupertinoIcons.heart_solid,
    size: 40.0,
    color: DefaultColors.white,
  );

  final Icon _noFavoriteIcon = Icon(
    CupertinoIcons.heart,
    size: 40.0,
    color: DefaultColors.white,
  );

  @override
  Widget build(BuildContext context) {
    final _appBloc = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: () async {
        _appBloc.toggleCouponFavorite(couponID: _couponID);
      },
      child: FutureBuilder<bool>(
        initialData: false,
        future: _appBloc.isCouponFavorite(couponID: _couponID),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
            case ConnectionState.done:
              if (snapshot.hasError) return _noFavoriteIcon;
              if (snapshot.data) return _favoriteIcon;
              return _noFavoriteIcon;
          }
          return null;
        },
      ),
    );
  }
}
