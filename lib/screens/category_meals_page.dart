import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_item.dart';
import '../providers/meals.dart';

class CategoryMealsPage extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsPage({
  //   @required this.categoryId,
  //   @required this.categoryTitle,
  // });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    String categoryId = routeArgs['categoryId'];
    String categoryTitle = routeArgs['categoryTitle'];

    final mealsData = Provider.of<Meals>(context);
    final categoryMeals = mealsData.getMealsByCategoryId(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        // padding: EdgeInsets.all(15),
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            difficulty: meal.difficulty,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
