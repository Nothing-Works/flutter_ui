import 'package:flutter/material.dart';

import '../models/location.dart';
import '../styles/styles.dart';

class LocationList extends StatelessWidget {
  final List<Location> _locations;

  LocationList(this._locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All'),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: _itemThumbnail(_locations[i]),
            title: _itemTitle(_locations[i]),
          );
        },
        itemCount: _locations.length,
      ),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(location.name, style: Style.textDefault);
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: Image.network(
        location.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
