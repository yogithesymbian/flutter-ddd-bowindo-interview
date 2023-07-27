import 'package:flutter_wonderwoman_projectscoid/application/error_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/application/loader_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/app_result.dart';
// import 'package:flutter_wonderwoman_projectscoid/infastructure/network/payload/device_payload.dart';
// import 'package:flutter_wonderwoman_projectscoid/infastructure/network/payload/oauth_password_payload.dart';
// import 'package:flutter_wonderwoman_projectscoid/infastructure/network/payload/oauth_token_payload.dart';
// import 'package:flutter_wonderwoman_projectscoid/domain/service/credential_app_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/service/credential_app_service.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/payload/auth_payload.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/helper/encryption_helper.dart';

class AuthState {
  AuthState({
    this.isLoggedIn,
  });

  bool? isLoggedIn;

  AuthState copyWith({bool? isLoggedIn}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

final authBlocProvider =
    StateNotifierProvider<AuthBloc, AuthState>((ref) => AuthBloc(ref));

class AuthBloc extends StateNotifier<AuthState> {
  AuthBloc(this.ref) : super(AuthState(isLoggedIn: false));
  final Ref ref;

  Future<void> signIn(String username, String password) async {
    LoaderBloc loaderBloc = ref.read(loaderBlocProvider.notifier);
    ErrorBloc errorBloc = ref.read(errorBlocProvider.notifier);
    CredentialAppService credentialAppService =
        ref.read(credentialAppServiceProvider);

    final authPasswordPayload = AuthPayload(
      userId: username,
      userPassword: calculateSHA256(password), // directly access hash256
    );

    loaderBloc
        .whileLoading(() => credentialAppService.signIN(authPasswordPayload))
        .then((value) {
      value.when(success: (model) async {
        credentialAppService.saveUserCredential(model);
        state = state.copyWith(isLoggedIn: true);
      }, failure: (error) {
        errorBloc.handle(error);
      });
    });
  }

  Future<void> refreshToken() async {
    //
  }
  Future<String?> token() async {
    final AppResult<String?> userID =
        await ref.read(credentialAppServiceProvider).getAccessToken();
    return userID.dataOrThrow;
  }

  Future<void> getMe() async {
    //
  }

  Future<String?> loadUserID() async {
    final AppResult<String?> userID =
        await ref.read(credentialAppServiceProvider).getUserID();
    return userID.dataOrThrow;
  }

  Future<String?> loadBranchID() async {
    final AppResult<String?> userID =
        await ref.read(credentialAppServiceProvider).getBranchID();
    return userID.dataOrThrow;
  }

  Future<void> signOut() async {
    await ref.read(credentialAppServiceProvider).deleteAll();
  }
}
