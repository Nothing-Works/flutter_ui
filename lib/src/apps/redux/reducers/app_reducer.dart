import 'package:redux/redux.dart';

import './counter_reducers.dart';
import '../actions/counter_actions.dart';
import '../models/app_state.dart';

Reducer<int> counterReducer = combineReducers<int>([
  TypedReducer<int, Increment>(incrementReducer),
  TypedReducer<int, Decrement>(decrementReducer),
]);

AppState appReducer(AppState state, action) =>
    AppState(counterReducer(state.counter, action));
