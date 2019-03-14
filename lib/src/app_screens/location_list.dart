import 'package:flutter/material.dart';

import '../app_screens/location_detail.dart';
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
        itemBuilder: _listView,
        itemCount: _locations.length,
      ),
    );
  }

  Widget _listView(BuildContext context, int i) {
    var location = _locations[i];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () => _navigateToLocationDetail(context, i),
    );
  }

  void _navigateToLocationDetail(BuildContext context, int i) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(_locations[i])));
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
