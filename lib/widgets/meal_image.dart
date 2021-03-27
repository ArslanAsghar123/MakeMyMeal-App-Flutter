import 'package:flutter/material.dart';

class MealImage extends StatelessWidget {
  final String title;
  final String imageUrl;

  MealImage({
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Meal Image.
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // Bottom Shadow Effect.
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                // const Color(0xCC000000),
                // const Color(0x00000000),
                const Color(0x00000000),
                const Color(0x88000000),
              ],
            ),
          ),
        ),

        // Meal Title.
        Positioned(
          child: Container(
            width: 300,
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          bottom: 20,
          right: 10,
        )
      ],
    );
  }
}
