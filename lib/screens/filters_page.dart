import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import '../models/filter.dart';
import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  // var _glutenFree = Filters.glutenFree;
  // var _vegan = Filters.vegan;
  // var _vegetarian = Filters.vegetarian;
  // var _lactoseFree = Filters.lactoseFree;

  @override
  Widget build(BuildContext context) {
    var mealsData = Provider.of<Meals>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            mealsData.filterMeals();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  'Your meals have been adjusted!',
                  style: TextStyle(fontSize: 15),
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          label: Text(
            'SAVE',
            style: Theme.of(context).textTheme.button,
          ),
          icon: Icon(Icons.save),
          isExtended: true,
          tooltip: 'Save Filters',
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Adjust your meals!",
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Divider(),

                // Glutten Free Toggle Button
                SwitchListTile(
                    title: Text("Glutten Free"),
                    subtitle: Text("Only include gluten free meals."),
                    value: Filters.glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        Filters.glutenFree = newValue;
                        Filters.isChanged = true;
                      });
                    }),
                Divider(),

                // Vegan Free Toggle Button
                SwitchListTile(
                    title: Text("Vegan"),
                    subtitle: Text("Only include vegan meals."),
                    value: Filters.vegan,
                    onChanged: (newValue) {
                      setState(() {
                        Filters.vegan = newValue;
                        Filters.isChanged = true;
                      });
                    }),
                Divider(),

                // Vegetarian Free Toggle Button
                SwitchListTile(
                    title: Text("Vegetarian"),
                    subtitle: Text("Only include vegetarian meals."),
                    value: Filters.vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        Filters.vegetarian = newValue;
                        Filters.isChanged = true;
                      });
                    }),
                Divider(),

                // Lactose Free Toggle Button
                SwitchListTile(
                    title: Text("Lactose Free"),
                    subtitle: Text("Only include lactose free meals."),
                    value: Filters.lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        Filters.lactoseFree = newValue;
                        Filters.isChanged = true;
                      });
                    }),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
