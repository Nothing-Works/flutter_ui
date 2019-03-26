import '../actions/counter_actions.dart';

int incrementReducer(int counter, Increment action) {
  return counter + 1;
}

int decrementReducer(int counter, Decrement action) {
  return counter - 1;
}
