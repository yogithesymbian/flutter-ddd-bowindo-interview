import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  AppState({
    required this.isLoaded,
  });

  final bool isLoaded;

  AppState copyWith({bool? isLoaded}) {
    return AppState(
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

final appBlocProvider =
    StateNotifierProvider<AppBloc, AppState>((ref) => AppBloc(ref));

class AppBloc extends StateNotifier<AppState> {
  AppBloc(this.ref) : super(AppState(isLoaded: false));
  final Ref ref;

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(isLoaded: true);
  }
}
