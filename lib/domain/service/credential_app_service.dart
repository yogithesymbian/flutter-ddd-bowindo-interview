import 'package:flutter_wonderwoman_projectscoid/infrastructure/local/credential_storage_service.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/credential_network_service.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/payload/auth_payload.dart';

import 'package:flutter_wonderwoman_projectscoid/domain/model/app_result.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/credential_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final credentialAppServiceProvider =
    Provider((ref) => CredentialAppService(ref.read));

class CredentialAppService {
  CredentialAppService(this._reader);

  final Reader _reader;

  late final _networkService = _reader(credentialNetworkServiceProvider);
  late final _storageService = _reader(credentialStorageServiceProvider);

  Future<AppResult<CredentialModel>> signIN(AuthPayload payload) {
    return AppResult.guardFuture(
      () async => _networkService.signIN(payload).then(
        (dto) {
          _storageService.saveAccessToken(
            accessToken: dto.token,
            refreshToken: dto.refresh,
          );
          return CredentialModel.fromJson(
            dto.data.toJson(),
          );
        },
      ),
    );
  }

  Future<AppResult<void>> logout() {
    return AppResult.guardFuture(
      () async => _networkService.logout().then((_) => true),
    );
  }

  Future<AppResult<void>> saveUserCredential(CredentialModel model) {
    return AppResult.guardFuture(
      () async => _storageService.saveUserCredential(
        userId: model.userId!,
        branchId: model.branchId!,
      ),
    );
  }

  Future<AppResult<void>> removeApiCredential() {
    return AppResult.guardFuture(
      () async => _storageService.removeUserCredential(),
    );
  }

  // Future<AppResult<void>> saveIsFirstOnBoarding() {
  //   return AppResult.guardFuture(
  //       () async => _storageService.saveIsFirstOnBoarding());
  // }
  // Future<AppResult<String?>> getIsFirstOnBoarding() {
  //   return AppResult.guardFuture(
  //       () async => _storageService.getIsFirstOnBoarding());
  // }

  Future<AppResult<void>> deleteAll() {
    return AppResult.guardFuture(() async => _storageService.deleteAll());
  }

  Future<AppResult<String?>> getAccessToken() {
    return AppResult.guardFuture(() async => _storageService.getAccessToken());
  }

  Future<AppResult<String?>> getRefreshToken() {
    return AppResult.guardFuture(() async => _storageService.getRefreshToken());
  }

  Future<AppResult<String?>> getUserID() {
    return AppResult.guardFuture(() async => _storageService.getUserID());
  }

  Future<AppResult<String?>> getBranchID() {
    return AppResult.guardFuture(() async => _storageService.getBranchID());
  }
}
