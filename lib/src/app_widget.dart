import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'modules/home/home_module.dart';
import 'shared/languages/pt-br/strings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      title: Strings.appName,
      theme: AppTheme.themeData,
      home: HomeModule(),
    );
  }
}
