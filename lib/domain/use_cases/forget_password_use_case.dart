

import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entites/requests/forget_password_request_entity.dart';
import '../entites/forget_password_response_entity.dart';
import '../repo/auth_repo.dart';

@injectable
class ForgetPasswordUseCase{
  AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);

  Future<ApiResult<ForgetPasswordResponseEntity>>
  call(ForgetPasswordRequestEntity request){
    return authRepo.forgetPassword(request);
  }
}