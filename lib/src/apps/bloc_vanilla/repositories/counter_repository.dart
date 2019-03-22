import 'package:flutter_ui/src/apps/bloc_vanilla/api_providers/counter_api_provider.dart';

class CounterRepository {
  final _counterApiProvider = CounterApiProvider();

  Future<int> fetchCounter() async => _counterApiProvider.fetchCounter();

  Future<int> increment() async => _counterApiProvider.increment();
}
