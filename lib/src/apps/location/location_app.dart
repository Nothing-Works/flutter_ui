import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/location/mocks/mock_location.dart';
import 'package:flutter_ui/src/apps/location/models/location.dart';
import 'package:flutter_ui/src/apps/location/screens/location_list.dart';

class LocationApp extends StatelessWidget {
  final List<Location> _mockLocations = MockLocation.fetchAll();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationList(_mockLocations));
  }
}
