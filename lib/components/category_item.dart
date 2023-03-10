import 'package:flutter/material.dart';
import 'package:food_stuff/screens/category_recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {required this.id, required this.title, required this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryRecipeScreen(
            categoryTitle: title,
            categoryId: id,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Color.fromRGBO(0, 0, 0, .5),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'Railway', fontWeight: FontWeight.w700, fontSize: 16),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(.5), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
