import 'package:flutter/material.dart';

import '../screens/about_us_screen.dart';
import '../screens/filters_page.dart';
import '../screens/tabs_page.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(
      String title, IconData iconData, Function onTapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 26,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!!!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          _buildListTile(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed(TabsPage.routeName);
            },
          ),
          Divider(),
          _buildListTile(
            "Filters",
            Icons.filter_list,
            () {
              // if(ModalRoute.of(context).is
              Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
            },
          ),
          Divider(),
          _buildListTile(
            "About Us",
            Icons.info_outline_rounded,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(AboutUsScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
