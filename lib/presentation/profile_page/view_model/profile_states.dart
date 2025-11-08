import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:equatable/equatable.dart';

enum ProfileStatus { initial, loading, success, error }

class ProfileStates extends Equatable {
  final ProfileStatus status;
  final UserInfoEntity? profileResponseEntity;
  final String? errorMessage;
  final String? logoutMessage;

  const ProfileStates({
    this.profileResponseEntity,
    this.status = ProfileStatus.initial,
    this.errorMessage,
    this.logoutMessage,
  });

  ProfileStates copyWith({
    ProfileStatus? status,
    UserInfoEntity? profileResponseEntity,
    String? errorMessage,
    String? logoutMessage,
  }) {
    return ProfileStates(
      status: status ?? this.status,
      profileResponseEntity:
          profileResponseEntity ?? this.profileResponseEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      logoutMessage: logoutMessage ?? this.logoutMessage,
    );
  }

  @override
  List<Object?> get props => [
    profileResponseEntity,
    status,
    errorMessage,
    logoutMessage,
  ];
}
