
import '../../shared/languages/pt-br/strings.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(Strings.homeTitle),
      ),
      child: ListView(
        children: <Widget>[
          Text('Text cupom 1'),
          Text('Text cupom 2'),
          Text('Text cupom 3'),
        ],
      ),
    );
  }
}
