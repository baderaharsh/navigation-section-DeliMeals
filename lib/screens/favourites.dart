import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favMeal;
  Favourites(this.favMeal);
  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Center(
        child: Text('You haven\'t added any favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favMeal[index].id,
            title: favMeal[index].title,
            imageUrl: favMeal[index].imageUrl,
            duration: favMeal[index].duration,
            complexity: favMeal[index].complexity,
            affordability: favMeal[index].affordability,
          );
        },
        itemCount: favMeal.length,
      );
    }
  }
}
