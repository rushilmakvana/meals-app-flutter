import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/categories_Screen.dart';
import 'package:meals_app/screens/filter_Screen.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Map<String, bool> filterdata = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };
  List<Meals> meals = DUMMY_MEALS;

  _filtermeals(Map<String, bool> filter) {
    setState(() {
      filterdata = filter;
      meals = DUMMY_MEALS.where((meal) {
        if (filterdata['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (filterdata['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (filterdata['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        if (filterdata['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meals> favorites = [];

  void _addfavorite(String mealId) {
    setState(() {
      final isfavorite = favorites.indexWhere((meal) => meal.id == mealId);
      if (isfavorite >= 0) {
        favorites.removeAt(isfavorite);
      } else {
        favorites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    });
  }

  _checkfavorite(String mealid) {
    return (favorites.any((meal) => meal.id == mealid));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMeals',
      // home: CategoryScreen(),
      // initialRoute: '/', bydefault '/'
      routes: {
        '/': (ctx) => TabsScreen(favorites),
        CategoryScreen.RouteName: (ctx) => Meal(meals),
        MealDetail.routeName: (ctx) => MealDetail(_addfavorite, _checkfavorite),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(filterdata, _filtermeals),
      },
      // onGenerateRoute: ((settings) => MaterialPageRoute(
      //       builder: ((context) => CategoryScreen()),
      //     )),
      // onUnknownRoute: ((settings) =>
      //     MaterialPageRoute(builder: (ctx) => CategoryScreen(),),),
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
    );
  }
}
