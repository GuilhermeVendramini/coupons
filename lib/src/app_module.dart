import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app_bloc.dart';
import 'app_widget.dart';
import 'repositories/lomadee/coupons/lomadee_coupons_repository.dart';

class AppModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          builder: (_) => AppProvider(
            LomadeeCouponsRepository(),
          ),
        ),
      ],
      child: AppWidget(),
    );
  }
}
