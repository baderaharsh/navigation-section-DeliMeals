import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FilterPage extends StatelessWidget {
  static const String pageRoute = '/filter-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filters!'),
      ),
    );
  }
}
