import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../repo/profile_repo.dart';

@injectable
class UploadUserPhotoUseCase {
  final ProfileRepo _profileRepo;

  UploadUserPhotoUseCase(this._profileRepo);

  Future<ApiResult<String>> call({required MultipartFile photo}) {
    return _profileRepo.uploadUserPhoto(photo);
  }
}
