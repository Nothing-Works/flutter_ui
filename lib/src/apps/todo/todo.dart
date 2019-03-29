import 'package:flutter/material.dart';

import './ui/todo_home.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoHome());
  }
}
