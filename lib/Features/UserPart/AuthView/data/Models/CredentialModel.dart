import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class CredentialModel {
  String? idToken;
  String? provider;

  CredentialModel({this.idToken, this.provider});

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  saveCredential() async {
    await _storage.write(key: tokenId, value: idToken);
    await _storage.write(key: providerId, value: provider);
  }

  // Delete CredentialModel from cache
  deleteCredential() async {
    await _storage.delete(key: tokenId);
    await _storage.delete(key: providerId);
  }

  // Get CredentialModel from cache
  Future<CredentialModel?> getCredential() async {
    try {
      final savedToken = await _storage.read(key: tokenId);
      final savedProvider = await _storage.read(key: providerId);

      if (savedToken != null && savedProvider != null) {
        return CredentialModel(idToken: savedToken, provider: savedProvider);
      }
    } catch (e) {
      // Handle any errors that might occur during read
      log("Error reading credentials: $e");
    }
    return null;
  }

  Map<String, dynamic> toJson() => {
        'idToken': idToken,
        'provider': provider,
      };
}
