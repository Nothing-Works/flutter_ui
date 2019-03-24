import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/src/apps/bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_ui/src/apps/bloc/ui/counter_page.dart';

class BlocHome extends StatefulWidget {
  @override
  _BlocHomeState createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  final CounterBloc _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(bloc: _counterBloc, child: CounterPage());
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
