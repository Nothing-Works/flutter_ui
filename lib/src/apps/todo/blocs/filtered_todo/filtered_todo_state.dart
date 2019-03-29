import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredTodoState extends Equatable {
  FilteredTodoState([List props = const []]) : super(props);
}

class InitialFilteredTodoState extends FilteredTodoState {}
