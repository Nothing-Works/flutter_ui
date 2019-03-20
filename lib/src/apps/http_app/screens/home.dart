import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/http_app/screens/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Http App')), body: Body());
  }
}
