import 'package:flutter/cupertino.dart';

import 'app_theme.dart';
import 'modules/home/home_module.dart';
import 'shared/languages/pt-br/strings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
          assert(index >= 0 && index <= 2);
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return SafeArea(
                    child: HomeModule(),
                  );
                },
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return SafeArea(
                    child: Text('Tab 2'),
                  );
                },
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return SafeArea(
                    child: Text('Tab 3'),
                  );
                },
              );
              break;
          }
          return null;
        },
      ),
    );
  }
}
