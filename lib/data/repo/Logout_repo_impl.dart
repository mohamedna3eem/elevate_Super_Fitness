import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/logout_remote_data_source.dart';

import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/logout_repo.dart';
@Injectable(as: LogoutRepo)

class LogoutRepoImpl implements LogoutRepo{
  final LogoutRemoteDataSource _logoutRemoteDataSource;
  LogoutRepoImpl(this._logoutRemoteDataSource);
  @override
  Future<ApiResult<LogOutResponseEntity>> logout() {
    final response=_logoutRemoteDataSource.logout();
    return response;
  }

}