import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/models/ice_cream.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/widgets/ice_cream_widget.dart';

class Home extends StatelessWidget {
  final List<IceCream> list;

  Home({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ice Cream'),
      ),
      body: ListView(
        children: list.map((IceCream iceCream) {
          return IceCreamWidget(iceCream: iceCream);
        }).toList(),
      ),
    );
  }
}
