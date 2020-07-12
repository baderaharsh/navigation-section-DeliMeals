import './categories_page.dart';
import 'package:flutter/material.dart';
import './favourites.dart';
import '../widgets/drawer.dart';
import '../models/meals.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favMeals;
  TabsPage(this.favMeals);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      Categories(),
      Favourites(widget.favMeals),
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: _selectedIndex == 0 ? Text('DeliMeals') : Text('Favourites'),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedIndex,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
              ),
              title: Text(
                'Categories',
              ),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.star,
              ),
              title: Text(
                'Favorites',
              ),
            ),
          ],
        ));
  }
}
