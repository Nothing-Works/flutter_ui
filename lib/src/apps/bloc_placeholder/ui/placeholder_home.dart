import 'package:flutter/material.dart';

import './placeholder_body.dart';

class PlaceHolderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Place Holder')),
        body: Center(child: PlaceHolderBody()));
  }
}
