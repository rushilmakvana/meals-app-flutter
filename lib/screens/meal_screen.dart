import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal-item.dart';

class Meal extends StatefulWidget {
  final List<Meals> meals;

  Meal(this.meals);

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  String title = '';
  List<Meals> CategoryMeals = [];
  var isloadeddata = false;
  @override
  void didChangeDependencies() {
    if (!isloadeddata) {
      final routeParams =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      title = routeParams['title'] as String;
      String id = routeParams['id'] as String;
      CategoryMeals = widget.meals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      isloadeddata = true;
    }
  }

  _removeMeal(id) {
    setState(() {
      CategoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: CategoryMeals[index].id,
            imgUrl: CategoryMeals[index].imgUrl,
            title: CategoryMeals[index].title,
            affordability: CategoryMeals[index].affordability,
            complexity: CategoryMeals[index].complexity,
            duration: CategoryMeals[index].duration,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
