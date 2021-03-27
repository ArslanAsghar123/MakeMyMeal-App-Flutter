import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class FavoriteMeals with ChangeNotifier {
  List<Meal> _favoriteMeals = [];
  Set<String> _favoriteMealIds = {};
  bool _isWaiting = false;

  final String _sharedPrefKey = 'favoriteMealIds';

  FavoriteMeals() {
    _load();
  }

  List<Meal> get favoriteMeals => List<Meal>.from(_favoriteMeals);

  bool get isWaiting => _isWaiting;

  void _load() => _store(load: true);
  void _save() => _store();

  bool isFavorite(String mealId) {
    return _favoriteMealIds.contains(mealId);
  }

  void addMealToFavorites(Meal meal) {
    if (_favoriteMealIds.add(meal.id)) {
      _favoriteMeals.insert(0, meal);
      // notifyListeners();
      _save();
    }
  }

  void removeMealFromFavorites(String mealId) {
    if (_favoriteMealIds.remove(mealId)) {
      int index = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
      _favoriteMeals.removeAt(index);
      // notifyListeners();
      _save();
    }
  }

  void _store({bool load = false}) async {
    _isWaiting = true;

    notifyListeners();

    // artificial delay to see the UI changes
    // await Future.delayed(Duration(milliseconds: 2000));

    try {
      final pref = await SharedPreferences.getInstance();

      if (load) {
        _favoriteMealIds = pref.getStringList(_sharedPrefKey).toSet();

        DUMMY_MEALS.forEach((meal) {
          if (_favoriteMealIds.contains(meal.id)) _favoriteMeals.add(meal);
        });
      } else {
        await pref.setStringList(_sharedPrefKey, _favoriteMealIds.toList());
      }
    } catch (error) {
      _favoriteMealIds = {};
      _favoriteMeals = [];
    }
    _isWaiting = false;

    notifyListeners();
  }
}
