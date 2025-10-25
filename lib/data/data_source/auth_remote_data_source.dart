import '../../core/api_result/api_result.dart';
import '../../domain/entites/requests/register_request_entity.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<String>> register(RegisterRequestEntity request);
}