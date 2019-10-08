import 'package:flutter/cupertino.dart';

import 'shared/colors/default_colors.dart';

class AppTheme {
  AppTheme._();

  static final CupertinoThemeData themeData = new CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: DefaultColors.primary,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: DefaultColors.white,
      ),
    ),
  );
}
