import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_bloc/bloc.dart';
import '../widget/todo_home_list.dart';

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
        body: BlocProvider<TodoBloc>(
          bloc: _todoBloc,
          child: TodoHomeList(),
        ));
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
