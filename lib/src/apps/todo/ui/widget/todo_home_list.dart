import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_bloc/bloc.dart';
import '../widget/todo_error.dart';
import '../widget/todo_indicator.dart';
import '../widget/todo_list.dart';

class TodoHomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoBloc _todoBloc = BlocProvider.of(context);

    return BlocBuilder(
        bloc: _todoBloc,
        builder: (BuildContext context, TodoState state) {
          if (state is TodoLoading) {
            return TodoIndicator();
          }
          if (state is TodoError) {
            return TodoErrorText(state.toString());
          }
          if (state is TodoLoaded) {
            return TodoList(state.todos);
          }
        });
  }
}
