import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import 'package:meals/widgets/trait.dart';

class MealItemInfo extends StatelessWidget {
  const MealItemInfo(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: Icon(Icons.star)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(height: 10),
            Trait(meal: meal),
            const Text(
              "Ingredeients",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.amber,
              ),
            ),
            for (final ing in meal.ingredients) Text(ing),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Steps",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.amber,
              ),
            ),
            for (int i = 0; i < meal.steps.length; i++)
              Row(
                children: [
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      "${i + 1} - ${meal.steps[i]}",
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
