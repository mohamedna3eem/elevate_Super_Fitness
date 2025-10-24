part of 'login_view_model.dart';

class LoginViewModelState extends Equatable {
  const LoginViewModelState({this.loginState});
  final BaseState<LoginResponseEntity>? loginState;

  LoginViewModelState copyWith({
    BaseState<LoginResponseEntity>? loginState,
  }) {
    return LoginViewModelState(loginState: loginState ?? this.loginState);
  }

  @override
  List<Object?> get props => [loginState];
}
