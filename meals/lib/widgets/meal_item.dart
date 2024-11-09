import "package:flutter/material.dart";

import "package:meals/models/meal.dart";
import "package:meals/widgets/meal_trait.dart";
import "package:meals/widgets/trait.dart";
import "package:transparent_image/transparent_image.dart";

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.selectedMeal});
  final Meal meal;
  final void Function() selectedMeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: selectedMeal,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      // overflow: TextOverflow.fade,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Trait(meal: meal),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
