import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';

abstract interface  class LogoutRepo {

  Future<ApiResult<LogOutResponseEntity>> logout();
}