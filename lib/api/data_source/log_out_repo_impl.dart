import 'package:elevate_super_fitness/api/mapper/logout_mapper.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';

import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/logout_remote_data_source.dart';
import '../client/api_client.dart';
@Injectable(as: LogoutRemoteDataSource)

class LogoutRemoteDataSourceImpl implements LogoutRemoteDataSource {
  final ApiClient _apiClient;
  LogoutRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<LogOutResponseEntity>> logout() async {
    return await safeApiCall(
      () => _apiClient.logout(),
      (response) => response.toEntity(),
    );
  }
}
