import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceryItems = [];
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        "flutter-prep-898ea-default-rtdb.firebaseio.com", "shopping-list.json");

    final response = await http.get(url);

// {"-OBfQCMMFpmiuh2AKrua":{"category":"Vegetables","name":"CHIPi","quantity":1},"-OBfU8ciFEFSAfls44aP":{"category":"Vegetables","name":"sd","quantity":1}}
// data comming like this thats why we declarre this type

    final Map<String, dynamic> responseData = json.decode(response.body);

    final List<GroceryItem> gItems = [];

    for (final item in responseData.entries) {
      final cat = categories.entries
          .firstWhere((c) => c.value.name == item.value["category"]);
      gItems.add(
        GroceryItem(
          id: item.key,
          name: item.value["name"],
          category: Category(cat.value.name, cat.value.color),
          quantity: item.value["quantity"],
        ),
      );
    }

    setState(() {
      groceryItems = gItems;
    });

    print(response.body);
  }

  void _addItem() async {
    final data = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );
    setState(() {
      groceryItems.add(data!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].category.color,
            ),
            trailing: Text(groceryItems[index].quantity.toString()),
          );
        },
      ),
    );
  }
}
