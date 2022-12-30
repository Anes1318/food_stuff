import 'package:flutter/material.dart';
import 'package:food_stuff/components/category_item.dart';
import 'package:food_stuff/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      title: 'Flutter App',
      home: CategoriesScreen(),
    );
  }
}
