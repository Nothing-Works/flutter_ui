import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_bloc/bloc.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final TodoBloc _todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Todo')),
        body: BlocBuilder(
            bloc: _todoBloc,
            builder: (BuildContext context, TodoState state) {
              if (state is TodoLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is TodoError) {
                return Center(child: Text(state.toString()));
              }
              if (state is TodoLoaded) {
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final todo = state.todos[index];
                      return ListTile(
                          title: Text(todo.title), subtitle: Text(todo.body));
                    });
              }
            }));
  }

  @override
  void dispose() {
    _todoBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _todoBloc.dispatch(FetchTodos());
    super.initState();
  }
}
