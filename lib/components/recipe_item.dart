import 'package:flutter/material.dart';
import 'package:food_stuff/models/meal.dart';
import 'package:food_stuff/screens/recipe_details_screen.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String imageUrl;
  final String title;
  final int duration;
  final Difficulty difficulty;
  final Affordability affordability;
  MealItem({
    required this.mealId,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.difficulty,
    required this.affordability,
  });

  String get getDifficulty {
    switch (difficulty) {
      case Difficulty.Simple:
        return 'Simple';

      case Difficulty.Challenging:
        return 'Challenging';

      case Difficulty.Hard:
        return 'Hard';
      default:
        return 'unknown';
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricy:
        return 'Pricy';

      case Affordability.Luxus:
        return 'Luxus';
      default:
        return 'unknown';
    }
  }

  void selectRecipe(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RecipeDetails(
        id: mealId,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectRecipe(context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
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
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text(
                        '${duration} min',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text(
                        getDifficulty,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined),
                      SizedBox(width: 5),
                      Text(
                        getAffordability,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
