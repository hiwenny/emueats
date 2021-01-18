import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/dummy_data.dart';

import './models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // There is a GridView.builder() for virtualised view.
    // Slivers are scrollable screen
    // gridDelegate takes care of structuring
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmuEats'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map((categoryData) =>
                CategoryItem(categoryData.title, categoryData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
