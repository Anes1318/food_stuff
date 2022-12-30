import 'package:flutter/material.dart';
import 'package:food_stuff/components/recipe_item.dart';
import 'package:food_stuff/dummy_data.dart';

class CategoryRecipeScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryRecipeScreen(
      {required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categoryIds.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            imageUrl: categoryMeals[index].imageUrl,
            mealId: categoryMeals[index].id,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            difficulty: categoryMeals[index].difficulty,
            affordability: categoryMeals[index].affordability,
          );
        },
      ),
    );
  }
}
