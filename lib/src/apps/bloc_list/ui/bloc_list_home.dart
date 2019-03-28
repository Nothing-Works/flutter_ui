import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class BlocListHome extends StatefulWidget {
  @override
  _BlocListHomeState createState() => _BlocListHomeState();
}

class _BlocListHomeState extends State<BlocListHome> {
  final ListBloc _itemBloc = ListBloc();

  _BlocListHomeState() {
    _itemBloc.dispatch(FetchItems());
  }

  @override
  void dispose() {
    _itemBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Bloc List')),
        body: BlocBuilder(
            bloc: _itemBloc,
            builder: (BuildContext context, ListState state) {
              if (state is InitialListState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ItemListError) {
                return Center(
                  child: Text('failed to fetch posts'),
                );
              }
              if (state is ItemListLoaded) {
                return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = state.items[index];
                      return ListTile(
                          leading: Checkbox(
                            value: item.complete,
                            onChanged: (checked) {
                              print(checked);
                            },
                          ),
                          title: Text(item.title),
                          subtitle: Text(item.body));
                    });
              }
            }));
  }
}
