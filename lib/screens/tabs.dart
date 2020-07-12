import './categories_page.dart';
import 'package:flutter/material.dart';
import './favourites.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Widget> _pages = [
    Categories(),
    Favourites(),
  ];

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Center(
            child: Text('Drawer'),
          ),
        ),
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
