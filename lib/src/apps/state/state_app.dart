import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/state/screens/counter.dart';

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Counter(),
    );
  }
}
