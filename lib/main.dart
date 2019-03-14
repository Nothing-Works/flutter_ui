import 'package:flutter/material.dart';

import './src/app_screens/location_list.dart';
import './src/mocks/mock_location.dart';
import './src/models/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Location _mockLocation = MockLocation.fetchAny();
  final List<Location> _mockLocations = MockLocation.fetchAll();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationList(_mockLocations));
  }
}
