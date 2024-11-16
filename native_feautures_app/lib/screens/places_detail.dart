import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:native_feautures_app/models/place.dart';

class PlacesDetail extends StatelessWidget {
  const PlacesDetail({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Center(
        child: Text(place.title),
      ),
    );
  }
}
