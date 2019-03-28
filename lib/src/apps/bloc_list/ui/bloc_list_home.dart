import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../filter_bloc/bloc.dart';
import '../model/visibility_filter.dart';

class BlocListHome extends StatefulWidget {
  @override
  _BlocListHomeState createState() => _BlocListHomeState();
}

class _BlocListHomeState extends State<BlocListHome> {
  final ListBloc _itemBloc = ListBloc();
  FilteredItemBloc _filterBloc;

  _BlocListHomeState() {
    _itemBloc.dispatch(FetchItems());
    _filterBloc = FilteredItemBloc(_itemBloc);
  }

  @override
  void dispose() {
    _itemBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bloc List'),
          actions: <Widget>[
            PopupMenuButton<VisibilityFilter>(
              onSelected: (filter) {
                _filterBloc.dispatch(UpdateFilter(filter));
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<VisibilityFilter>>[
                  PopupMenuItem<VisibilityFilter>(
                    value: VisibilityFilter.all,
                    child: Text('All'),
                  ),
                  PopupMenuItem<VisibilityFilter>(
                    value: VisibilityFilter.active,
                    child: Text('Active'),
                  ),
                  PopupMenuItem<VisibilityFilter>(
                    value: VisibilityFilter.completed,
                    child: Text('Completed'),
                  ),
                ];
              },
            )
          ],
        ),
        body: BlocBuilder(
            bloc: _filterBloc,
            builder: (BuildContext context, FilteredItemState state) {
              if (state is InitialFilteredItemState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FilteredItemLoaded) {
                return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = state.items[index];
                      return ListTile(
                          leading: Checkbox(
                            value: item.complete,
                            onChanged: (checked) {
                              _itemBloc.dispatch(ToggleItem(
                                  item: item.copyWith(complete: checked)));
                            },
                          ),
                          title: Text(item.title),
                          subtitle: Text(item.body));
                    });
              }
            }));
  }
}
