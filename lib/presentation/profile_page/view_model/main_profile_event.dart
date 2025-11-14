sealed class MainProfileEvent {}

class MainProfileLogoutEvent extends MainProfileEvent {}

class MainProfileGetHelpDataEvent extends MainProfileEvent {}

class MainProfileGetPrivacyAndPolicyEvent extends MainProfileEvent {}

class MainProfileGetSecurityAndConfigEvent extends MainProfileEvent {}

class MainProfileChangeLocalEvent extends MainProfileEvent {
  final bool value;

  MainProfileChangeLocalEvent({required this.value});
}
