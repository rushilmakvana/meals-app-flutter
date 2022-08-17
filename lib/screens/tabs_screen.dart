import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_Screen.dart';
import 'package:meals_app/screens/drawer.dart';
import 'package:meals_app/screens/favorite_meals.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> favorites;

  TabsScreen(this.favorites);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int pageIndex = 0;
  List<Map<String, Object>> pages = [];
  selectPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': Favorites(widget.favorites), 'title': 'Favorites'},
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[pageIndex]['title'] as String,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: pages[pageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
            activeIcon: Icon(Icons.category_sharp),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: 'Favorite',
            activeIcon: Icon(Icons.star_sharp),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Color.fromARGB(255, 234, 226, 226),
      ),
    );
  }
}
