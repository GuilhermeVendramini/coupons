import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app_bloc.dart';
import 'app_theme.dart';
import 'modules/favorites/favorites_module.dart';
import 'modules/home/home_module.dart';
import 'shared/languages/pt-br/strings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    _bloc.loadCoupons();
    _bloc.loadFavorites();

    return CupertinoApp(
      title: Strings.appName,
      theme: AppTheme.themeData,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text(Strings.homeTitle),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_solid),
              title: Text(Strings.favoritesTitle),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.collections_solid),
              title: Text(Strings.myCouponsTitle),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoPageScaffold(
                child: SafeArea(
                  child: HomeModule(),
                ),
              );
              break;
            case 1:
              return CupertinoPageScaffold(
                child: SafeArea(
                  child: FavoritesModule(),
                ),
              );
              break;
            case 2:
              return CupertinoPageScaffold(
                child: SafeArea(
                  child: Text('2'),
                ),
              );
              break;
          }
          return null;
        },
      ),
    );
  }
}
