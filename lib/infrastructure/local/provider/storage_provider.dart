import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Storage {
  Future<void> write(String key, String value);

  Future<String?> read(String key);

  Future<void> delete(String key);

  Future<void> deleteAll();
}

class SecureClient implements Storage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }
}

final storageClientProvider = Provider<Storage>((_) => SecureClient());
