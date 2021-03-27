import 'package:flutter/material.dart';

class MealInfo extends StatelessWidget {
  final int duration;
  final String difficulty;
  final String affordability;

  MealInfo({
    @required this.duration,
    @required this.affordability,
    @required this.difficulty,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(Icons.schedule),
              SizedBox(
                width: 6,
              ),
              Text('$duration min'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.work),
              SizedBox(
                width: 6,
              ),
              Text(difficulty),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_money),
              SizedBox(
                width: 6,
              ),
              Text(affordability),
            ],
          ),
        ],
      ),
    );
  }
}
