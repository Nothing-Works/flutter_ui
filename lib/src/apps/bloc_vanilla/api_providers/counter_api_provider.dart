class CounterApiProvider {
  Future<int> fetchCounter() async {
    await Future.delayed(Duration(seconds: 1));
    return 2;
  }
}
