import '../models/meals.dart';
import 'package:flutter/material.dart';
import '../screens/meal_details_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function handleDelete;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.handleDelete,
  });

  // String get complexityText {
  //   if (complexity == Complexity.Simple) {
  //     return 'Simple';
  //   } else if (complexity == Complexity.Challenging) {
  //     return 'Challenging';
  //   } else if (complexity == Complexity.Hard) {
  //     return 'Hard';
  //   }
  // }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Medium:
        return 'Pricey';
        break;
      case Affordability.Expensive:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailsPage.pageRoute,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        handleDelete(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration min',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        complexityText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        affordabilityText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
