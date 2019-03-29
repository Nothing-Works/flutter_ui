import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  @override
  FilteredTodoState get initialState => InitialFilteredTodoState();

  @override
  Stream<FilteredTodoState> mapEventToState(
    FilteredTodoEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
