import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/auth_local_data_source.dart';
import 'package:elevate_super_fitness/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/login_request_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(this._authRemoteDataSource, this._authLocalDataSource);
  @override
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity request,
  }) async {
    final responseEntity = await _authRemoteDataSource.login(request: request);
    if (responseEntity is ApiSuccessResult<LoginResponseEntity>) {
      final loginData = responseEntity.data;
      final token = loginData.token ?? '';
      await _authLocalDataSource.saveLoginData(
        rememberMe: request.rememberMe,
        token: token,
      );
    }
    return responseEntity;
  }
}
