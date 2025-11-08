part of 'edit_profile_view_model.dart';

final class EditProfileState extends Equatable {
  final bool isLoading;
  final bool isUserPhotoLoading;
  final String? errorMessage;
  final UserInfoEntity? userData;
  final File? pickedImage;

  const EditProfileState({
    this.isLoading = false,
    this.isUserPhotoLoading = false,
    this.errorMessage,
    this.userData,
    this.pickedImage,
  });

  EditProfileState copyWith({
    bool? isLoading,
    bool? isUserPhotoLoading,
    String? errorMessage,
    UserInfoEntity? userData,
    File? pickedImage,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      isUserPhotoLoading: isUserPhotoLoading ?? this.isUserPhotoLoading,
      errorMessage: errorMessage,
      userData: userData ?? this.userData,
      pickedImage: pickedImage ?? this.pickedImage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isUserPhotoLoading,
    errorMessage,
    userData,
    pickedImage,
  ];
}
