import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/app_error.dart';

final errorBlocProvider =
    StateNotifierProvider<ErrorBloc, List<AppError>>((ref) => ErrorBloc());

class ErrorBloc extends StateNotifier<List<AppError>> {
  ErrorBloc() : super([]);

  void handle(AppError error) {
    state = [...state, error];
  }

  void remove() {
    state.removeAt(0);
    state = state;
  }
}
