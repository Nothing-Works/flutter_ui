import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/item.dart';

@immutable
abstract class ListEvent extends Equatable {
  ListEvent([List props = const []]) : super(props);
}

class FetchItems extends ListEvent {
  @override
  String toString() {
    return 'FetchItems';
  }
}

class ToggleItem extends ListEvent {
  final Item item;

  ToggleItem({this.item}) : super([item]);

  @override
  String toString() {
    return 'ToggleItem{item: ${item.id}}';
  }
}
