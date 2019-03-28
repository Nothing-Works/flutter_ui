import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/item.dart';
import '../model/visibility_filter.dart';

@immutable
abstract class FilteredItemEvent extends Equatable {
  FilteredItemEvent([List props = const []]) : super(props);
}

class UpdateFilter extends FilteredItemEvent {
  final VisibilityFilter filter;

  UpdateFilter(this.filter) : super([filter]);

  @override
  String toString() {
    return 'UpdateFilter{filter: $filter}';
  }
}

class UpdateItems extends FilteredItemEvent {
  final List<Item> items;

  UpdateItems(this.items) : super([items]);

  @override
  String toString() {
    return 'UpdateItems{items: ${items.length}}';
  }
}
