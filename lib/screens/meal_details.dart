import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = 'meal-detail';
  final Function isfavorite;
  final Function addfavorite;

  MealDetail(this.addfavorite, this.isfavorite);

  Widget TitleBuilder(String title) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget ListBuilder(List<String> list) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('#${index + 1}'),
                ),
                title: Text(
                  list[index],
                ),
              ),
              const Divider(thickness: 1, indent: 30, endIndent: 30),
            ],
          );
        },
        itemCount: list.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MealId = ModalRoute.of(context)?.settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((ele) => ele.id == MealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(
            fontFamily: 'Raleway',
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              TitleBuilder('Ingredients'),
              ListBuilder(meal.ingredients),
              TitleBuilder('Steps'),
              ListBuilder(meal.steps),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addfavorite(MealId);
        },
        child: Icon(isfavorite(MealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
