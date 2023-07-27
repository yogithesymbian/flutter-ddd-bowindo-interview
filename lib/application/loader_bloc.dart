import 'package:flutter_riverpod/flutter_riverpod.dart';

final loaderBlocProvider =
    StateNotifierProvider<LoaderBloc, int>((ref) => LoaderBloc());

class LoaderBloc extends StateNotifier<int> {
  LoaderBloc() : super(0);
  Future<T> whileLoading<T>(Future<T> Function() future) {
    return Future.microtask(_add).then((_) => future()).whenComplete(_remove);
  }

  void _add() {
    state = state + 1;
  }

  void _remove() {
    state = state - 1;
  }
}
