import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Place {
  Place({required this.title}) : id = uuid.v4();
  final String id; // Automatically generated unique ID
  final String title; // Title of the place
}
