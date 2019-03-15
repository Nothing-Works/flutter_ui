import 'package:flutter_ui/src/apps/location/models/location_fact.dart';

class Location {
  final String name;
  final String url;
  final List<LocationFact> facts;

  Location({this.name, this.url, this.facts});
}
