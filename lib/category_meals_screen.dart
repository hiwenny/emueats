import 'package:flutter/material.dart';

import './dummy_data.dart';
class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  // I. Simple routing example instantiation
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    // II. Named routes navigation
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    // Filtering for meal objects containing matching categoryIds
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    } ).toList();
    // final filtered
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      // body: Center(
      //   child: Text(
      //     'Recipes for this category',
      //   ),
      // ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Text(categoryMeals[index].title);
      }, itemCount: categoryMeals.length,)
    );
  }
}
