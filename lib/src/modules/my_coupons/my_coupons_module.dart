import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import 'my_coupons_bloc.dart';
import 'my_coupons_page.dart';

class MyCouponsModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appBloc = Provider.of<AppProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCouponsProvider>(
          builder: (_) => MyCouponsProvider(_appBloc),
        ),
      ],
      child: MyCouponsPage(),
    );
  }
}
