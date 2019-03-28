import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/item.dart';

@immutable
abstract class ListState extends Equatable {
  ListState([List props = const []]) : super(props);
}

class InitialListState extends ListState {
  @override
  String toString() {
    return 'InitialListState';
  }
}

class ItemListLoaded extends ListState {
  final List<Item> items;

  ItemListLoaded({this.items}) : super([items]);

  @override
  String toString() {
    return 'ItemListLoaded{items: ${items.length}}';
  }
}

class ItemListError extends ListState {
  @override
  String toString() {
    return 'ItemListError';
  }
}
