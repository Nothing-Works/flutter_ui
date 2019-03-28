import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../repository/item_repository.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final _itemRepository = ItemRepository();

  @override
  ListState get initialState => InitialListState();

  @override
  void onTransition(Transition<ListEvent, ListState> transition) {
    print(transition);
  }

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is FetchItems) {
      if (currentState is InitialListState) {
        try {
          var items = await _itemRepository.fetchAll();
          yield ItemListLoaded(items: items);
        } catch (_) {
          yield ItemListError();
        }
      }
    }
  }
}
