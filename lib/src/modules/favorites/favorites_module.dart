import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';
import 'favorites_bloc.dart';
import 'favorites_page.dart';

class FavoritesModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appBloc = Provider.of<AppProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritesProvider>(
          builder: (_) => FavoritesProvider(_appBloc),
        ),
      ],
      child: FavoritesPage(),
    );
  }
}
