import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/config/env.dart';
import 'package:encrypt/encrypt.dart' as aes;

String calculateSHA256(String input) {
  var bytes = utf8.encode(input); // Convert the input string to bytes
  var digest = sha256.convert(bytes); // Calculate the SHA-256 hash
  return digest.toString(); // Return the hash as a hex string
}

class EncryptionHelper {
  String? dataToDecrypt;
  String? plainText; // just on development used
  final String _encryptionKey = Env.encryptionKey;

  EncryptionHelper({
    this.dataToDecrypt,
    this.plainText,
  });

  String? decrypt(String ivString) {
    try {
      final key = aes.Key.fromUtf8(_encryptionKey);
      // final iv = aes.IV.fromLength(16);
      final iv = aes.IV.fromBase64(ivString);

      final encrypter = aes.Encrypter(
        aes.AES(
          key,
          mode: aes.AESMode.cbc,
          padding: null,
        ),
      );
      return encrypter.decrypt64('$dataToDecrypt', iv: iv).toString();
    } catch (err) {
      return 'error $err';
    }
  }

  String? encrypt() {
    try {
      final key = aes.Key.fromUtf8(_encryptionKey);
      final iv = aes.IV.fromLength(16);

      final encrypter = aes.Encrypter(
        aes.AES(
          key,
          mode: aes.AESMode.cbc,
          padding: null,
        ),
      );

      final encrypted = encrypter.encrypt('$plainText', iv: iv);
      return encrypted.base64.toString();
    } catch (err) {
      return 'error $err';
    }
  }
}
