import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ChangeNotifierProvider使用/UserChangeNotifierProviderScreen.dart';
import 'FutureProvider使用/UserFutureProviderScreen.dart';
import 'Provider使用/UserProviderScreen.dart';
import 'StreamProvider使用/UserStreamProviderScreen.dart';

class LearnListScreen extends StatefulWidget {
  LearnListScreen({Key key}) : super(key: key);

  @override
  _LearnListScreenState createState() => _LearnListScreenState();
}

class _LearnListScreenState extends State<LearnListScreen> {
  List<ItemStyle> items = [
    ItemStyle(title: "Provider使用", screen: UserProviderScreen()),
    ItemStyle(
        title: "ChangeNotifierProvider使用",
        screen: UserChangeNotifierProviderScreen()),
    ItemStyle(title: "FutureProvider使用", screen: UserFutureProviderScreen()),
    ItemStyle(title: "StreamProvider使用", screen: UserStreamProviderScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      child: InkWell(
        child: Center(child: Text("${items[index].title}")),
        onTap: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (BuildContext context) {
            return items[index].screen;
          }));
        },
      ),
    );
  }
}

class ItemStyle {
  String title;
  Widget screen;
  ItemStyle({this.title, this.screen});
}