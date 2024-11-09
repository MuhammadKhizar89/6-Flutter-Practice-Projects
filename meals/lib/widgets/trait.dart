import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_trait.dart';

class Trait extends StatelessWidget {
  const Trait({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MealTrait(icon: Icons.schedule, label: "${meal.duration} min"),
        const SizedBox(width: 12),
        MealTrait(
            icon: Icons.work,
            label: meal.complexity.name[0].toUpperCase() +
                meal.complexity.name.substring(1)),
        const SizedBox(width: 12),
        MealTrait(
            icon: Icons.attach_money,
            label: meal.affordability.name[0].toUpperCase() +
                meal.affordability.name.substring(1)),
      ],
    );
  }
}
