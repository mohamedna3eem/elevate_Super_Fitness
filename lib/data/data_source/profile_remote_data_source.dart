import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ApiResult<UserInfoEntity>> getUserLoggedData();
}
