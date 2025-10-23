import 'package:equatable/equatable.dart';

class LoginRequestEntity extends Equatable {
  final String? email;
  final String? password;
  final bool rememberMe;
  const LoginRequestEntity({
    this.email,
    this.password,
    this.rememberMe = false,
  });

  @override
  List<Object?> get props => [email, password, rememberMe];
}
