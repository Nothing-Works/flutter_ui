import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/state/stateless_widget/counter_button.dart';
import 'package:flutter_ui/src/apps/state/stateless_widget/counter_text.dart';

class CounterBody extends StatefulWidget {
  @override
  _CounterBodyState createState() => _CounterBodyState();
}

class _CounterBodyState extends State<CounterBody> {
  int _counter = 0;
  void _onPressed() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CounterText(_counter), CounterButton(_onPressed)],
      ),
    );
  }
}
