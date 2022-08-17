import 'package:flutter/material.dart';
import '../screens/categories_Screen.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;
  CategoryItem(this.id, this.color, this.title);

  void selectedMealScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryScreen.RouteName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMealScreen(context),
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.5), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            // fontFamily: 'RobotoCondensed',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
