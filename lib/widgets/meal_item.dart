import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void mealDetailScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealDetailScreen(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
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
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'RobotoCondensed',
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
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_rounded),
                      SizedBox(width: 6),
                      Text('$affordabilityText'),
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
