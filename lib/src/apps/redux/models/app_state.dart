class AppState {
  final int counter;

  AppState(this.counter);

  factory AppState.initialState() => AppState(0);
}
