import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_feautures_app/providers/places.dart';
import 'package:native_feautures_app/widgets/image_input.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();
  void _addPlace() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter Place"),
        ),
      );
      return;
    }
    ref.read(placesProvider.notifier).addPlace(_titleController.text);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
                controller: _titleController,
              ),
              const SizedBox(height: 10),
              const ImageInput(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addPlace,
                child: const Text("Add Item"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
