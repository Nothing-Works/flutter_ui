import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/bloc_vanilla/blocs/counter_bloc.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void initState() {
    super.initState();
    counterBloc.fetchCounter();
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      floatingActionButton:
          FlatButton(onPressed: () {}, child: Icon(Icons.add)),
      body: StreamBuilder<int>(
        stream: counterBloc.counter,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text('${snapshot.data}'));
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
