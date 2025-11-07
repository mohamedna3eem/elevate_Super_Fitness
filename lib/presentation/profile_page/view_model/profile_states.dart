import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entites/profile/profile_response_entity.dart';

enum ProfileStatus { initial, loading, success, error }


class ProfileStates extends Equatable {

  final ProfileStatus status;
  final ProfileResponseEntity? profileResponseEntity;
  final String? errorMessage;
  final LogOutResponseEntity? logOutResponseEntity;


  const ProfileStates({
    this.profileResponseEntity,
    this.status = ProfileStatus.initial,
    this.errorMessage,
    this.logOutResponseEntity

  });

  ProfileStates copyWith({

    ProfileStatus? status,
   ProfileResponseEntity?profileResponseEntity,
    String? errorMessage,
     LogOutResponseEntity ? logOutResponseEntity,

  }) {
    return ProfileStates(
      status: status ?? this.status,
      profileResponseEntity: profileResponseEntity ?? this.profileResponseEntity,
      errorMessage: errorMessage ?? this.errorMessage,
        logOutResponseEntity:logOutResponseEntity??this.logOutResponseEntity,
    );
  }

  @override
  List<Object?> get props => [
    profileResponseEntity,
    status, errorMessage,logOutResponseEntity];
}