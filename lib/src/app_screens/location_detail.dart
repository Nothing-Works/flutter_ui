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

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];
    result.add(_bannerImage(location.url, 200.0));
    result.addAll(_renderChildren(context, location));
    return result;
  }

  List<Widget> _renderChildren(BuildContext context, Location location) {
    var result = <Widget>[];
    location.facts.forEach((fact) {
      result.add(_title(fact.title));
      result.add(_text(fact.text));
    });
    return result;
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }

  Widget _title(String text) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 25.0, color: Colors.black),
      ),
    );
  }

  Widget _text(String text) {
    return Container(padding: EdgeInsets.all(25.0), child: Text(text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Andy'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, _location),
      ),
    );
  }
}
