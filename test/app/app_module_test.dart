import 'package:coupons/src/app_bloc.dart';
import 'package:coupons/src/app_module.dart';
import 'package:coupons/src/repositories/lomadee/coupons/lomadee_coupons_repository.dart';
import 'package:coupons/src/repositories/sqflite/coupons/sqflite_coupons_repository.dart';
import 'package:coupons/src/shared/languages/pt-br/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final _bloc = AppProvider(
    LomadeeCouponsRepository(),
    SqfliteCouponsRepository(),
  );

  setUp((){
    _bloc.loadCoupons();
    _bloc.loadFavorites();
    _bloc.loadMyCoupons();
  });

  testWidgets('AppModule', (WidgetTester tester) async {
    await tester.pumpWidget(AppModule());
    final _homeKey = Key('home');

    expect(find.byKey(_homeKey), findsOneWidget);
    
    final _homeIcon = find.widgetWithIcon(CupertinoTabBar, CupertinoIcons.home);
    final _heartSolidIcon = find.widgetWithIcon(CupertinoTabBar, CupertinoIcons.heart_solid);
    final _collectionsSolidIcon = find.widgetWithIcon(CupertinoTabBar, CupertinoIcons.collections_solid);

    expect(_homeIcon, findsOneWidget);
    expect(_heartSolidIcon, findsOneWidget);
    expect(_collectionsSolidIcon, findsOneWidget);

    await tester.tap(_heartSolidIcon);
    await tester.pump();

    final _favoritesKey = Key('favorites');

    expect(find.byKey(_favoritesKey), findsOneWidget);

    if(_bloc.getFavoriteCouponsID.isEmpty) {
      print('Favorites is Empty');
      expect(find.text(Strings.favoritesEmptyMessage), findsOneWidget);
    }
  });
}