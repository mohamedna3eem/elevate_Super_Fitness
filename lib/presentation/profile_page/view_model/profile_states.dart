import 'package:equatable/equatable.dart';
import '../../../domain/entites/profile/profile_response_entity.dart';

enum ProfileStatus { initial, loading, success, error }


class ProfileStates extends Equatable {

  final ProfileStatus status;
  final ProfileResponseEntity? profileResponseEntity;
  final String? errorMessage;


  const ProfileStates({
    this.profileResponseEntity,
    this.status = ProfileStatus.initial,
    this.errorMessage,

  });

  ProfileStates copyWith({

    ProfileStatus? status,
   ProfileResponseEntity?profileResponseEntity,
    String? errorMessage,
  }) {
    return ProfileStates(
      status: status ?? this.status,
      profileResponseEntity: profileResponseEntity ?? this.profileResponseEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    profileResponseEntity,
    status, errorMessage];
}