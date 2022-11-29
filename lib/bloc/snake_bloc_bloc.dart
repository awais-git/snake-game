import 'package:flutter_bloc/flutter_bloc.dart';
part 'snake_bloc_event.dart';
part 'snake_bloc_state.dart';

class SnakeBlocBloc extends Bloc<SnakeBlocEvent, SnakeBlocState> {
  SnakeBlocBloc() : super(SnakeBlocInitial()) {
    on<SnakeBlocEvent>((event, emit) {
    });
  }
}
