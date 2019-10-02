import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'home_bloc.dart';
import 'home_page.dart';

class HomeModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(builder: (_) => HomeProvider()),
      ],
      child: HomePage(),
    );
  }
}