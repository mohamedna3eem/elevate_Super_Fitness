import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';

abstract interface class ProfileRepo {

  Future<ApiResult<ProfileResponseEntity>>getProfileData();
}
