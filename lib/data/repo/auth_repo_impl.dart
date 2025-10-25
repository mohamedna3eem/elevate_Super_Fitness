import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/requests/register_request_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ApiResult<String>> register(RegisterRequestEntity request) {
    return _authRemoteDataSource.register(request);
  }
}
