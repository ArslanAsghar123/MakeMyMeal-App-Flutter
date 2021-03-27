import 'package:flutter/foundation.dart';

enum Difficulty { Easy, Medium, Hard }

enum Affordability { Cheap, Moderate, Expensive, VeryExpensive }

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Difficulty difficulty;
  final Affordability affordability;

  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.affordability,
    @required this.difficulty,
    @required this.duration,
    @required this.steps,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}

String getDifficultyText(difficulty) {
  switch (difficulty) {
    case Difficulty.Easy:
      return 'Easy';
      break;
    case Difficulty.Medium:
      return 'Medium';
      break;
    case Difficulty.Hard:
      return 'Hard';
      break;
    default:
      return 'Unknown';
  }
}

String getAffordabilityText(affordability) {
  switch (affordability) {
    case Affordability.Cheap:
      return 'Cheap';
      break;
    case Affordability.Moderate:
      return 'Moderate';
      break;
    case Affordability.Expensive:
      return 'Expensive';
      break;
    case Affordability.VeryExpensive:
      return 'Very Expensive';
      break;
    default:
      return 'Unknown';
  }
}
