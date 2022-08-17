import 'package:flutter/material.dart';
import './drawer.dart';
import 'categories_Screen.dart';

class FiltersScreen extends StatefulWidget {
  final filterdata;
  final Function filtermeals;

  FiltersScreen(this.filterdata, this.filtermeals);

  static String routeName = 'filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isvegan = false;

  var islactosefree = false;

  var isglutenfree = false;

  var isvegetarian = false;

  @override
  void initState() {
    isglutenfree = widget.filterdata['gluten'];
    isvegetarian = widget.filterdata['vegetarian'];
    islactosefree = widget.filterdata['lactose'];
    isvegan = widget.filterdata['vegan'];
  }

  switchBuilder(bool val, Function updatedVal, title, subtittle) {
    return SwitchListTile(
      value: val,
      onChanged: updatedVal as Function(bool),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
        ),
      ),
      subtitle: Text(
        subtittle,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter Meals',
          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final filterd = {
                'gluten': isglutenfree,
                'lactose': islactosefree,
                'vegetarian': isvegetarian,
                'vegan': isvegan,
              };
              widget.filtermeals(filterd);
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              'Adjust Meals selection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          switchBuilder(
            isvegan,
            (newval) {
              setState(() {
                isvegan = newval;
              });
            },
            'Vegan',
            'include Vegan foods only',
          ),
          switchBuilder(
            islactosefree,
            (newval) {
              setState(() {
                islactosefree = newval;
              });
            },
            'Lactose free',
            'include Lactose free foods only',
          ),
          switchBuilder(
            isvegetarian,
            (newval) {
              setState(() {
                isvegetarian = newval;
              });
            },
            'Vegetarian',
            'include Vegetarian foods only',
          ),
          switchBuilder(
            isglutenfree,
            (newval) {
              setState(() {
                isglutenfree = newval;
              });
            },
            'Gluten free',
            'include gluten free foods only',
          ),
        ],
      ),
    );
  }
}
