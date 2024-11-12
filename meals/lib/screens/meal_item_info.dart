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
    final favoriteMeal = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeal.contains(meal);
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
            // icon: AnimatedSwitcher(
            //   duration: const Duration(milliseconds: 300),
            //   transitionBuilder: (child, animation) {
            //     return RotationTransition(
            //       turns: Tween<double>(begin: 0.9, end: 1).animate(animation),
            //       child: child,
            //     );
            //   },
            //   child: Icon(
            //     isFavorite ? Icons.star : Icons.star_border,
            //     key: ValueKey(isFavorite),
            //   ),
            // ),
            // )
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                    turns: Tween<double>(begin: 0.6, end: 1).animate(animation),
                    child: child);
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: meal.id, child: Image.network(meal.imageUrl)),
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
