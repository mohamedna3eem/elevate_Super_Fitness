import 'package:elevate_super_fitness/api/client/local_data.dart';
import 'package:elevate_super_fitness/api/mapper/profile_mapper.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/profile_local_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/help_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/privacy_policy_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/security_roles_config_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final LocalData _localData;
  ProfileLocalDataSourceImpl(this._secureStorage, this._localData);
  Future<void> _saveValue({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> saveUserToken({required String token}) {
    return _saveValue(key: ConstKeys.keyUserToken, value: token);
  }

  @override
  Future<void> deleteRememberMe({required String key}) async {
    return await _secureStorage.delete(key: key);
  }

  @override
  Future<void> deleteTokenToken({required String key}) async {
    return await _secureStorage.delete(key: key);
  }

  @override
  Future<ApiResult<HelpResponseEntity>> getHelpData() async {
    return await safeApiCall(
      () => _localData.getHlpData(),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<PrivacyPolicyResponseEntity>>
  getPrivacyAndPolicyData() async {
    return await safeApiCall(
      () => _localData.getPrivacyPolicyData(),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<SecurityRolesConfigResponseEntity>>
  getSecurityRolesConfigData() async {
    return await safeApiCall(
      () => _localData.getSecurityRolesConfigData(),
      (response) => response.toEntity(),
    );
  }
}
