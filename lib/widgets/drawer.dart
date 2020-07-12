import 'package:flutter/material.dart';
import '../screens/filter_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String text, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCodensed',
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Cooking up!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FilterPage.pageRoute);
          }),
        ],
      ),
    );
  }
}
