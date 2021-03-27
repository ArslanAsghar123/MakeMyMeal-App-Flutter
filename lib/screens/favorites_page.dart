import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_meals.dart';
import '../widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoriteMealsData = Provider.of<FavoriteMeals>(context);

    if (favoriteMealsData.isWaiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    var favoriteMeals = favoriteMealsData.favoriteMeals;

    if (favoriteMeals.isEmpty) {
      return Center(
        child: NoFavorites(),
      );
    } else {
      return ListView.builder(
        // padding: EdgeInsets.all(15),
        itemBuilder: (ctx, index) {
          final meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            difficulty: meal.difficulty,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}

class NoFavorites extends StatelessWidget {
  const NoFavorites({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Icon(
            Icons.favorite,
            size: 100,
            color: Colors.grey.withOpacity(0.3),
          ),
          Text(
            "No Favorites!",
            softWrap: true,
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey.withOpacity(0.5),
              // fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Mark your favorite meals\n so you can easily find them here.',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.8),
              // fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
              fontSize: 18,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
