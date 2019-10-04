import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _appBloc = Provider.of<AppProvider>(context);

    if (_appBloc.getCouponsState == CouponsState.LOADING) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return Text(_appBloc.getCoupons.toString());
  }
}
