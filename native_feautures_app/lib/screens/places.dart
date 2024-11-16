import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_feautures_app/models/place.dart';
import 'package:native_feautures_app/providers/places.dart';
import 'package:native_feautures_app/screens/add_place.dart';
import 'package:native_feautures_app/widgets/places_list.dart';

class Places extends ConsumerWidget {
  const Places({super.key});

  void _newScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const AddPlace();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          IconButton(
            onPressed: () {
              _newScreen(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(
        places: places,
      ),
    );
  }
}
