import 'package:flutter/material.dart';

import './todo_item.dart';
import '../../model/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList(this.todos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) =>
            TodoItem(todos[index]));
  }
}
