import 'package:flutter/material.dart';

import '../../model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem(this.todo);
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(todo.title), subtitle: Text(todo.body));
  }
}
