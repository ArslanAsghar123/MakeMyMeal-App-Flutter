import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details_page.dart';
import 'meal_image.dart';
import 'meal_short_info.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Difficulty difficulty;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.difficulty,
  });

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailsPage.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            MealImage(
              title: title,
              imageUrl: imageUrl,
            ),
            MealInfo(
              duration: duration,
              affordability: getAffordabilityText(affordability),
              difficulty: getDifficultyText(difficulty),
            ),
          ],
        ),
      ),
    );
  }
}
