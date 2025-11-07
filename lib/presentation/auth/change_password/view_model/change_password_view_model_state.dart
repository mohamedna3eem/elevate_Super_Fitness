part of 'change_password_view_model_cubit.dart';

class ChangePasswordViewModelState extends Equatable {
  const ChangePasswordViewModelState({this.changePasswordResponse});
  final BaseState<ChangePasswordResponseEntity>? changePasswordResponse;
  ChangePasswordViewModelState copyWith({
    BaseState<ChangePasswordResponseEntity>? changePasswordResponse,
  }) {
    return ChangePasswordViewModelState(
      changePasswordResponse:
          changePasswordResponse ?? this.changePasswordResponse,
    );
  }

  @override
  List<Object?> get props => [changePasswordResponse];
}
