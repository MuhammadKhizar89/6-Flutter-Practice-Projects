import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Your Category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text(
            "1",
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.amber,
              fontSize: 300,
            ),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
