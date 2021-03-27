import 'package:flutter/material.dart';

class StepsList extends StatelessWidget {
  final List<String> steps;
  final double height;
  final double width;

  final ScrollController _scrollController = ScrollController(
    keepScrollOffset: true,
  );

  StepsList({
    @required this.steps,
    this.height = 200.0,
    this.width = 400.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 0,
          ),
          controller: _scrollController,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  steps[index],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              elevation: 0,
            ),
          ),
          itemCount: steps.length,
        ),
      ),
    );
  }
}
