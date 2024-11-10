import "package:flutter/material.dart";
import "package:meals/models/meal.dart";
import "package:meals/screens/meal_item_info.dart";
import "package:meals/widgets/meal_item.dart";

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key,
      required this.meals,
      required this.title,
      required this.onToggleFavorite});
  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  void _selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealItemInfo(meal: meal, onToggleFavorite: onToggleFavorite),
      ),
    );
  }

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
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            selectedMeal: () {
              _selectedMeal(context, meals[index]);
            }),
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
