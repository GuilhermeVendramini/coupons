import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../app_bloc.dart';
import '../../colors/default_colors.dart';
import '../../languages/pt-br/strings.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);

    return CupertinoTextField(
      style: TextStyle(
        color: DefaultColors.primary,
      ),
      placeholder: Strings.searchPlaceholder,
      suffix: Icon(CupertinoIcons.search),
      autofocus: false,
      focusNode: FocusNode()..unfocus(),
      onChanged: _bloc.searchCoupons,
    );
  }
}
