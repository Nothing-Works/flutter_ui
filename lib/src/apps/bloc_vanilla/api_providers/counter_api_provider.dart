class CounterApiProvider {
  int counter = 1;
  Future<int> fetchCounter() async {
    await Future.delayed(Duration(seconds: 1));
    return counter;
  }

  Future<int> increment() async {
    await Future.delayed(Duration(seconds: 1));
    counter++;
    return counter;
  }
}
