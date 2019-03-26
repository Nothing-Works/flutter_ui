import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import './models/app_state.dart';
import './reducers/app_reducer.dart';
import './ui/redux_home.dart';

class ReduxApp extends StatelessWidget {
  final store =
      Store<AppState>(appReducer, initialState: AppState.initialState());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ReduxHome(store: store));
  }
}
