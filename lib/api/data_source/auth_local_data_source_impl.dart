import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/auth_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  AuthLocalDataSourceImpl(this._secureStorage);
  Future<void> _saveValue({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> saveUserRememberMe({required bool rememberMe}) {
    return _saveValue(
      key: ConstKeys.keyRememberMe,
      value: rememberMe.toString(),
    );
  }

  @override
  Future<void> saveUserToken({required String token}) {
    return _saveValue(key: ConstKeys.keyUserToken, value: token);
  }

  @override
  Future<void> saveLoginData({
    required String token,
    required bool rememberMe,
  }) async {
    saveUserRememberMe(rememberMe: rememberMe);
    saveUserToken(token: token);
  }
}
