import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/mapper/register_mapper.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/domain/entites/requests/register_request_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<String>> register(RegisterRequestEntity request) {
    return safeApiCall(
      () => _apiClient.register(request.toRequest()),
      (response) => response.message ?? "",
    );
  }
}
