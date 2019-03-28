import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/item.dart';
import '../model/visibility_filter.dart';

@immutable
abstract class FilteredItemState extends Equatable {
  FilteredItemState([List props = const []]) : super(props);
}

class InitialFilteredItemState extends FilteredItemState {
  @override
  String toString() {
    return 'InitialFilteredItemState';
  }
}

class FilteredItemLoaded extends FilteredItemState {
  final List<Item> items;
  final VisibilityFilter filter;

  FilteredItemLoaded({@required this.items, @required this.filter})
      : super([items, filter]);

  @override
  String toString() {
    return 'FilteredItemLoaded{items: ${items.length}, filter: $filter}';
  }
}
