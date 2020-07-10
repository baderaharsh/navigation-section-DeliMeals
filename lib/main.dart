import 'package:flutter/material.dart';
import 'screens/categories_page.dart';
import './screens/category_meals_page.dart';
import './screens/meal_details_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            )),
      ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Categories(),
        '/categories': (ctx) => CategoryMealsPage(),
        MealDetailsPage.pageRoute: (ctx) => MealDetailsPage(),
      },
    );
  }
}
