part of 'register_view_model.dart';

final class RegisterState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccessful;

  const RegisterState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccessful = false,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccessful,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccessful: isSuccessful ?? this.isSuccessful,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, isSuccessful];
}
