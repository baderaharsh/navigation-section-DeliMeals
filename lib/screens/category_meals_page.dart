import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealsPage extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsPage(this.categoryId, this.categoryTitle);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var isInitialized = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      isInitialized = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            handleDelete: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
