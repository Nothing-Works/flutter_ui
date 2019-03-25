import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/src/apps/bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_ui/src/apps/bloc/bloc/counter_bloc/counter_event.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of(context);

    return BlocBuilder<CounterEvent, int>(
      builder: (BuildContext context, int state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter example'),
          ),
          body: Center(
            child: Text(
              '$state',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  _counterBloc.dispatch(CounterEvent.increment);
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  _counterBloc.dispatch(CounterEvent.decrement);
                },
                child: Icon(Icons.remove),
              )
            ],
          ),
        );
      },
      bloc: _counterBloc,
    );
  }
}
