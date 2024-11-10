import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              Theme.of(context).colorScheme.primaryContainer,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(width: 18),
              Text(
                "Cooking Up!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            "Meals",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          onTap: () {
            onSelectScreen("meals");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            "Filters",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          onTap: () {
            onSelectScreen("filters");
          },
        ),
      ]),
    );
  }
}
