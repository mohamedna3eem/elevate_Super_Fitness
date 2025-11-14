part of 'main_profile_view_model_cubit.dart';

class MainProfileViewModelState extends Equatable {
  const MainProfileViewModelState({
    this.logout,
    this.helpData,
    this.privacyAndPolicyData,
    this.securityAndConfigData,
  });
  final BaseState<LogoutResponseEntity>? logout;
  final BaseState<HelpResponseEntity>? helpData;
  final BaseState<PrivacyPolicyResponseEntity>? privacyAndPolicyData;
  final BaseState<SecurityRolesConfigResponseEntity>? securityAndConfigData;
  MainProfileViewModelState copyWith({
    BaseState<LogoutResponseEntity>? logout,
    BaseState<HelpResponseEntity>? helpData,
    BaseState<PrivacyPolicyResponseEntity>? privacyAndPolicyData,
    BaseState<SecurityRolesConfigResponseEntity>? securityAndConfigData,
  }) {
    return MainProfileViewModelState(
      logout: logout ?? this.logout,
      helpData: helpData ?? this.helpData,
      privacyAndPolicyData: privacyAndPolicyData ?? this.privacyAndPolicyData,
      securityAndConfigData:
          securityAndConfigData ?? this.securityAndConfigData,
    );
  }

  @override
  List<Object?> get props => [
    logout,
    helpData,
    securityAndConfigData,
    privacyAndPolicyData,
  ];
}
