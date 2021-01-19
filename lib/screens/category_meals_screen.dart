import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // I. Simple routing example instantiation
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    // II. Named routes navigation
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    // Filtering for meal objects containing matching categoryIds
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    // final filtered
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
          ),
        ),
        // body: ListView.builder(itemBuilder: (context, index) {
        //   return Text(categoryMeals[index].title);
        // }, itemCount: categoryMeals.length,)
        body: ListView.builder(
          itemBuilder: (context, index) {
            final currentMeal = categoryMeals[index];
            // Can we spread op this?
            return MealItem(
              title: currentMeal.title,
              imageUrl: currentMeal.imageUrl,
              duration: currentMeal.duration,
              complexity: currentMeal.complexity,
              affordability: currentMeal.affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
