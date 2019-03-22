import 'package:flutter_ui/src/apps/bloc_vanilla/repositories/counter_repository.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _counter = CounterRepository();
  final _counterFetcher = PublishSubject<int>();

  Observable<int> get counter => _counterFetcher.stream;

  fetchCounter() async {
    int counter = await _counter.fetchCounter();
    _counterFetcher.sink.add(counter);
  }

  dispose() {
    _counterFetcher.close();
  }
}

final counterBloc = CounterBloc();
