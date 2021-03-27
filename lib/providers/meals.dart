import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../models/filter.dart';

class Meals with ChangeNotifier {
  List<Meal> _meals = DUMMY_MEALS;

  List<Meal> get meals {
    return List<Meal>.from(_meals);
  }

  List<Meal> getMealsByCategoryId(String categoryId) {
    return _meals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  Meal getMealById(String mealId) {
    return _meals.firstWhere((meal) => meal.id == mealId);
  }

  void filterMeals() {
    if (Filters.isChanged) {
      _meals = DUMMY_MEALS.where((meal) {
        if (Filters.glutenFree && !meal.isGlutenFree) return false;

        if (Filters.lactoseFree && !meal.isLactoseFree) return false;

        if (Filters.vegan && !meal.isVegan) return false;

        if (Filters.vegetarian && !meal.isVegetarian) return false;

        return true;
      }).toList();

      // Filters.toggleIsChanged();
      Filters.isChanged = false;
      notifyListeners();
    }
  }
}
