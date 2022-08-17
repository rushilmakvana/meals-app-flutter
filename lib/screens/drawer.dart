import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_Screen.dart';

class MyDrawer extends StatelessWidget {
  ListTilebuilder(IconData icon, String string, VoidCallback function) {
    return ListTile(
      onTap: function,
      leading: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        string,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(130),
                  // bottomLeft: Radius.circular(30),
                )),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Meals App',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTilebuilder(Icons.restaurant, 'Categories', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          ListTilebuilder(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
