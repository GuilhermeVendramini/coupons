import 'package:coupons/src/shared/colors/default_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../../shared/languages/pt-br/strings.dart';

class EmptyMyCouponsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            CupertinoIcons.collections_solid,
            size: 60.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            Strings.myCouponsEmptyMessage,
            style: TextStyle(color: DefaultColors.primary),
          ),
        ],
      ),
    );
  }
}
