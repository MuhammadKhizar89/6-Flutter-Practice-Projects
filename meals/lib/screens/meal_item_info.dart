import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';

import 'package:meals/widgets/trait.dart';

class MealItemInfo extends ConsumerWidget {
  const MealItemInfo({super.key, required this.meal});

  final Meal meal;
  void _showInfoMessage(context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealNavoriteStatus(meal);
                _showInfoMessage(
                    context, wasAdded ? "Meal Added" : "Meal Removed");
              },
              icon: const Icon(Icons.star)),
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
