import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../model/todo.dart';
import '../../repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository = TodoRepository();

  @override
  TodoState get initialState => TodoLoading();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is FetchTodos) {
      yield* _mapFetchTodoToState();
    }
  }

  Stream<TodoState> _mapFetchTodoToState() async* {
    try {
      final List<Todo> todos = await todoRepository.todos();
      yield TodoLoaded(todos);
    } catch (_) {
      yield TodoError();
    }
  }
}
