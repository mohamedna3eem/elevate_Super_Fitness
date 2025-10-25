import 'package:elevate_super_fitness/core/api_result/api_result.dart';

import '../entites/requests/register_request_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<String>> register(RegisterRequestEntity request);
}