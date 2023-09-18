import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

mixin SecureStorageService {
  String? get token;

  Future<void> getToken();

  Future<void> putToken(String token);

  Future<void> clearToken();
}

@Singleton(as: SecureStorageService)
class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage storage;

  SecureStorageServiceImpl({required this.storage});

  String? _token;

  @override
  String? get token => _token;

  @override
  Future<void> getToken() async {
    final accessToken = await storage.read(key: 'access_token');
    _token = accessToken;
  }

  @override
  Future<void> clearToken() async {
    _token = null;
    await storage.delete(key: 'access_token');
  }

  @override
  Future<void> putToken(String token) async {
    _token = token;
    await storage.write(key: 'access_token', value: token);
  }
}
