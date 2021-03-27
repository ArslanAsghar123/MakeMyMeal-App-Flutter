import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {
  final List<String> ingredients;
  final double height;
  final double width;

  final ScrollController _scrollController = ScrollController(
    keepScrollOffset: true,
  );

  IngredientsList({
    @required this.ingredients,
    this.height = 200.0,
    this.width = 300.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(bottom: 6.0),
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (ctx, index) => Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                ingredients[index],
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            elevation: 1.0,
          ),
          itemCount: ingredients.length,
        ),
      ),
    );
  }
}
