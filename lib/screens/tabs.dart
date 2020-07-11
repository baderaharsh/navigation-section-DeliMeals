import './categories_page.dart';
import 'package:flutter/material.dart';
import './favourites.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('DeliMeals'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[
            Categories(),
            Favourites(),
          ]),
        ));
  }
}
