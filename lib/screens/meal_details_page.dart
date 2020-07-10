import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  static const String pageRoute = '/meal-details-page';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details Page'),
      ),
      body: Center(
        child: Text('Hoorray... Reached here!'),
      ),
    );
  }
}
