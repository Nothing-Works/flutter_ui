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
        return Center(
          child: Text(
            '$state',
            style: TextStyle(fontSize: 24.0),
          ),
        );
      },
      bloc: _counterBloc,
    );
  }
}
