import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal-item.dart';

class Favorites extends StatelessWidget {
  final List<Meals> favorite;

  Favorites(this.favorite);

  @override
  Widget build(BuildContext context) {
    if (favorite.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: const Text(
          'No favorite Meals yet..',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: ((context, index) {
        return MealItem(
          id: favorite[index].id,
          imgUrl: favorite[index].imgUrl,
          title: favorite[index].title,
          affordability: favorite[index].affordability,
          complexity: favorite[index].complexity,
          duration: favorite[index].duration,
        );
      }),
      itemCount: favorite.length,
    );
  }
}
