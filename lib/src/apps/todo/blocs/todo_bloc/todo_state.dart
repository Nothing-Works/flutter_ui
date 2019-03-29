import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/todo.dart';

@immutable
abstract class TodoState extends Equatable {
  TodoState([List props = const []]) : super(props);
}

class TodoLoading extends TodoState {
  @override
  String toString() {
    return 'TodoLoading';
  }
}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos) : super([todos]);

  @override
  String toString() {
    return 'TodoLoaded{todos: ${todos.length}}';
  }
}

class TodoError extends TodoState {
  @override
  String toString() {
    return 'TodoError can not load';
  }
}
