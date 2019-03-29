import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TodoEvent extends Equatable {
  TodoEvent([List props = const []]) : super(props);
}

class FetchTodos extends TodoEvent {
  @override
  String toString() {
    return 'FetchTodos';
  }
}
