import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/login_request_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity request,
  });

  Future<ApiResult<String>> register(RegisterRequestEntity request);
}
