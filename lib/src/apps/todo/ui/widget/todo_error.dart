import 'package:flutter/material.dart';

class TodoErrorText extends StatelessWidget {
  final String errorMessage;

  TodoErrorText(this.errorMessage);
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
