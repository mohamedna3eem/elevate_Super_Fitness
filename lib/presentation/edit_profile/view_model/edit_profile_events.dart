sealed class EditProfileEvents {}

class GetUserDataProfileEvent extends EditProfileEvents {}

class ToggleButtonStatusProfileEvent extends EditProfileEvents {}

class UploadUserPhotoProfileEvent extends EditProfileEvents {}

class UpdateUserProfileEvent extends EditProfileEvents {
  final bool isBodyInfo;
  UpdateUserProfileEvent({required this.isBodyInfo});
}