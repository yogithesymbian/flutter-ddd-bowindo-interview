import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/local/provider/storage_provider.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/config/keys.dart';

final credentialStorageServiceProvider =
    Provider((ref) => CredentialStorageService(ref.read));

class CredentialStorageService {
  final Reader _reader;

  CredentialStorageService(this._reader);

  Future<void> saveUserCredential({
    required String userId,
    required String branchId,
  }) async {
    await _reader(storageClientProvider).write(Keys.userId, userId);
    await _reader(storageClientProvider).write(Keys.branchId, branchId);
  }

  Future<void> removeUserCredential() async {
    await _reader(storageClientProvider).delete(Keys.userId);
    await _reader(storageClientProvider).delete(Keys.branchId);
  }

  Future<void> deleteAll() async {
    await _reader(storageClientProvider).deleteAll();
  }

  Future<void> saveAccessToken(
      {required String accessToken, required String refreshToken}) async {
    await _reader(storageClientProvider).write(Keys.accessToken, accessToken);
    await _reader(storageClientProvider).write(Keys.refreshToken, refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _reader(storageClientProvider).read(Keys.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _reader(storageClientProvider).read(Keys.refreshToken);
  }

  Future<String?> getIsFirstOnBoarding() async {
    return await _reader(storageClientProvider).read(Keys.isFirstOnBoarding);
  }

  Future<String?> getUserID() async {
    return await _reader(storageClientProvider).read(Keys.userId);
  }

  Future<String?> getBranchID() async {
    return await _reader(storageClientProvider).read(Keys.branchId);
  }

  Future<String?> getEmail() async {
    return await _reader(storageClientProvider).read(Keys.email);
  }
}
