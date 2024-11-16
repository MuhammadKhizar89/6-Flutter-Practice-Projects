import 'package:flutter/material.dart';
import 'package:native_feautures_app/models/place.dart';
import 'package:native_feautures_app/screens/places_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text("No Places Added yet"),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(places[index].title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlacesDetail(
                place: places[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
