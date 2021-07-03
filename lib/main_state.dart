class MainState {
  final int counter;

  MainState({required this.counter});

  factory MainState.initial() => MainState(counter: 0);
}
