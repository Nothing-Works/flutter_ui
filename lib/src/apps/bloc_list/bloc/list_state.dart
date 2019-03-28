import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListState extends Equatable {
  ListState([List props = const []]) : super(props);
}

class InitialListState extends ListState {}
