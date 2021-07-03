import 'package:bloc_poc/main_event.dart';
import 'package:bloc_poc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.initial());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is MainIncrementEvent) {
      yield MainState(counter: state.counter + 1);
    } else if (event is MainDecrementEvent) {
      yield MainState(counter: state.counter - 1);
    }
  }
}
