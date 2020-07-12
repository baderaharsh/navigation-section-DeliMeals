import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsPage extends StatelessWidget {
  static const String pageRoute = '/meal-details-page';

  final Function toggleFavorites;
  final Function isMealFav;
  MealDetailsPage(this.toggleFavorites, this.isMealFav);

  Widget buildTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildList(
      BuildContext ctx, Widget child, double height, double width) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(ctx).size.height * height,
      width: MediaQuery.of(ctx).size.width * width,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealDetail.title}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  mealDetail.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle(context, 'Ingredients'),
              buildList(
                  context,
                  ListView.builder(
                    itemBuilder: (context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(mealDetail.ingredients[index]),
                      ),
                    ),
                    itemCount: mealDetail.ingredients.length,
                  ),
                  0.25,
                  0.75),
              buildTitle(context, 'Steps'),
              buildList(
                  context,
                  ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(
                            mealDetail.steps[index],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                    itemCount: mealDetail.steps.length,
                  ),
                  0.6,
                  0.9),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavorites(mealId);
        },
      ),
    );
  }
}
