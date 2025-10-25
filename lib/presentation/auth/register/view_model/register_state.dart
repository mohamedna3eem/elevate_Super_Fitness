part of 'register_view_model.dart';

final class RegisterState extends Equatable {
  final bool isLoading;
  final String? errorMessage;

  const RegisterState({
    this.isLoading = false,
    this.errorMessage,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage];
}