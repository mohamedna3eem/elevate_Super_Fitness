import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/profile_use_case.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_events.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';
import '../../../domain/entites/profile/profile_response_entity.dart';
import '../../../domain/use_cases/logout_use_case.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final ProfileUseCase profileUseCase;
  final LogoutUseCase logoutUseCase;


  ProfileViewModel(this.profileUseCase,this.logoutUseCase)
      : super( const ProfileStates());

  void doIntent(ProfileEvents event) {
    if (event is ProfileEvent) {
      _getProfileData();
  } if (event is LogoutEvent) {
      _logout();
  }
  }

  Future<void> _getProfileData() async {
    emit(state.copyWith(status: ProfileStatus.loading));

    final result = await profileUseCase();

    if (result is ApiSuccessResult<ProfileResponseEntity>) {
      emit(state.copyWith(
        status: ProfileStatus.success,
        profileResponseEntity: result.data,
        errorMessage: null,
      ));
    } else if (result is ApiErrorResult) {
      emit(state.copyWith(
        status: ProfileStatus.error,
        errorMessage: "Error loading workouts",
      ));
    }
  }
  Future<void> _logout() async {
    emit(state.copyWith(status: ProfileStatus.loading));

    final result = await logoutUseCase();

    if (result is ApiSuccessResult<LogOutResponseEntity>) {
      emit(state.copyWith(
        status: ProfileStatus.success,
        logOutResponseEntity: result.data,
        errorMessage: null,
      ));
    } else if (result is ApiErrorResult) {
      emit(state.copyWith(
        status: ProfileStatus.error,
        errorMessage: "Error loading workouts",
      ));
    }
  }

}