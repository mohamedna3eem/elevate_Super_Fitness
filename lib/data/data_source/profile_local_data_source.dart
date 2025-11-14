import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/help_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/privacy_policy_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/security_roles_config_entity.dart';

abstract interface class ProfileLocalDataSource {
  Future<void> saveUserToken({required String token});
  Future<void> deleteTokenToken({required String key});
  Future<void> deleteRememberMe({required String key});
  Future<ApiResult<HelpResponseEntity>> getHelpData();
  Future<ApiResult<PrivacyPolicyResponseEntity>> getPrivacyAndPolicyData();
  Future<ApiResult<SecurityRolesConfigResponseEntity>>
  getSecurityRolesConfigData();
}
