import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../bloc/bloc.dart';
import '../model/item.dart';
import '../model/visibility_filter.dart';

class FilteredItemBloc extends Bloc<FilteredItemEvent, FilteredItemState> {
  StreamSubscription<ListState> itemSubscription;
  final ListBloc itemBloc;

  FilteredItemBloc(this.itemBloc) {
    itemSubscription = itemBloc.state.listen((ListState state) {
      if (state is ItemListLoaded) {
        dispatch(UpdateItems((itemBloc.currentState as ItemListLoaded).items));
      }
    });
  }

  @override
  void dispose() {
    itemSubscription.cancel();
    super.dispose();
  }

  @override
  FilteredItemState get initialState {
    if (itemBloc.currentState is ItemListLoaded) {
      return FilteredItemLoaded(
          items: (itemBloc.currentState as ItemListLoaded).items,
          filter: VisibilityFilter.all);
    } else {
      return InitialFilteredItemState();
    }
  }

  @override
  Stream<FilteredItemState> mapEventToState(FilteredItemEvent event) async* {
    if (event is UpdateFilter) {
      yield* _mapUpdateFilterToState(event);
    }
    if (event is UpdateItems) {
      yield* _mapUpdateItemToState(event);
    }
  }

  @override
  void onTransition(
      Transition<FilteredItemEvent, FilteredItemState> transition) {
    print(transition);
  }

  Stream<FilteredItemState> _mapUpdateFilterToState(UpdateFilter event) async* {
    if (itemBloc.currentState is ItemListLoaded) {
      yield FilteredItemLoaded(
          items: _mapItemsToFilteredItems(
              (itemBloc.currentState as ItemListLoaded).items, event.filter),
          filter: event.filter);
    }
  }

  Stream<FilteredItemState> _mapUpdateItemToState(UpdateItems event) async* {
    final visibilityFilter = currentState is FilteredItemLoaded
        ? (currentState as FilteredItemLoaded).filter
        : VisibilityFilter.all;
    yield FilteredItemLoaded(
        items: _mapItemsToFilteredItems(
            (itemBloc.currentState as ItemListLoaded).items, visibilityFilter),
        filter: visibilityFilter);
  }

  List<Item> _mapItemsToFilteredItems(
      List<Item> items, VisibilityFilter filter) {
    return items.where((item) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.active) {
        return !item.complete;
      } else if (filter == VisibilityFilter.completed) {
        return item.complete;
      }
    }).toList();
  }
}
