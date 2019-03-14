import 'package:flutter/material.dart';

import '../models/location.dart';

class LocationList extends StatelessWidget {
  final List<Location> _locations;

  LocationList(this._locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All'),
      ),
      body: null,
    );
  }
}
