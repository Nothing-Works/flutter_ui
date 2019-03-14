import 'package:flutter/material.dart';

import '../models/location.dart';

class LocationDetail extends StatelessWidget {
  final Location _location;

  LocationDetail(this._location);

  Widget _box(String text, {Color color = Colors.red}) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Text(text),
    );
  }

  List<Widget> _renderChildren(Location location) {
    var result = <Widget>[];
    location.facts.forEach((fact) {
      result.add(_title(fact.title));
      result.add(_text(fact.text));
    });
    return result;
  }

  Widget _title(String text) => Text(text);

  Widget _text(String text) => Text(text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Andy'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderChildren(_location),
      ),
    );
  }
}
