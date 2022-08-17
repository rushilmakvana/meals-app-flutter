import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category-item.dart';
import 'package:meals_app/dummy-data.dart';

class CategoryScreen extends StatelessWidget {
  static final RouteName = 'Meal-Screen';

  @override
  Widget build(BuildContext context) {
    // print('done');
    return GridView(
      padding: const EdgeInsets.all(20),
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((item) {
        return CategoryItem(item.id, item.color, item.title);
      }).toList(),
    );
  }
}
