import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/state/stateful_widget/counter_body.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: CounterBody(),
    );
  }
}
