import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux/redux.dart';

import '../actions/counter_actions.dart';
import '../models/app_state.dart';

class ReduxHome extends StatelessWidget {
  final Store<AppState> store;

  ReduxHome({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        child: Scaffold(
            appBar: AppBar(title: Text('Redux App')),
            body: StoreConnector<AppState, int>(
                builder: (BuildContext context, int counter) {
                  return Center(child: Text('$counter'));
                },
                converter: (store) => store.state.counter),
            floatingActionButton: StoreConnector<AppState, VoidCallback>(
                builder: (BuildContext context, VoidCallback callback) {
              return FloatingActionButton(
                onPressed: callback,
                child: Icon(Icons.add),
              );
            }, converter: (store) {
              return () => store.dispatch(Increment());
            }),
            endDrawer: ReduxDevTools<AppState>(store)),
        store: store);
  }
}
