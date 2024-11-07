import "package:flutter/material.dart";
import "package:meals/models/meal.dart";

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Oh No ,No Data Available"),
          SizedBox(
            height: 20,
          ),
          Text("Please Check other Meal"),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => Text(meals[index].title),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
