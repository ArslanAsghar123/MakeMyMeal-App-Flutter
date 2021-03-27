import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/categories_page.dart';
import 'screens/category_meals_page.dart';
import 'screens/meal_details_page.dart';
import 'screens/tabs_page.dart';
import 'screens/filters_page.dart';
import 'screens/about_us_screen.dart';

import 'providers/meals.dart';
import 'providers/favorite_meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Meals()),
        ChangeNotifierProvider(create: (_) => FavoriteMeals()),
      ],
      builder: (_, __) => MaterialApp(
        title: 'Make My Meal',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          accentColor: Colors.orange,
          canvasColor: Colors.amber[100],
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(
                  fontSize: 20,
                ),
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: TabsPage(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsPage(), // Home or Default Route.
          TabsPage.routeName: (ctx) => TabsPage(),
          CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
          MealDetailsPage.routeName: (ctx) => MealDetailsPage(),
          FiltersPage.routeName: (ctx) => FiltersPage(),
          AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
        },

        // onGenerateRoute takes a function which executes for any named navigation action
        // (= pushNamed()) for which no registered route is found on the routes table.
        // The function should return a navigation action (e.g. MaterialPageRoute).
        onGenerateRoute: (routeSettings) {
          print(routeSettings.name);
          print(routeSettings.arguments);

          return MaterialPageRoute(
            builder: (ctx) => CategoriesPage(),
          );
        },

        // onUnknownRoute handles unidentified routes when
        // onGenerateRoute is not specified or doesn't return valid navigation action.
        onUnknownRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (ctx) => CategoriesPage(),
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
