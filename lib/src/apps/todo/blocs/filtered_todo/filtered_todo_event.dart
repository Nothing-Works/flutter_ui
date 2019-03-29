import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredTodoEvent extends Equatable {
  FilteredTodoEvent([List props = const []]) : super(props);
}
