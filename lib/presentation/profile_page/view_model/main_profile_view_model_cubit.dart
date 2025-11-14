import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/core/app_config/app_config.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/domain/entites/help_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/privacy_policy_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/security_roles_config_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_help_data_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_privacy_and_policy_data.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_security_roles_config_data.dart';
import 'package:elevate_super_fitness/domain/use_cases/logout_use_case.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/main_profile_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'main_profile_view_model_state.dart';

@injectable
class MainProfileViewModelCubit extends Cubit<MainProfileViewModelState> {
  MainProfileViewModelCubit(
    this._logoutUseCase,
    this._helpDataUseCase,
    this._privacyAndPolicyData,
    this._securityRolesConfigData,
  ) : super(const MainProfileViewModelState());
  final LogoutUseCase _logoutUseCase;
  final GetHelpDataUseCase _helpDataUseCase;
  final GetPrivacyAndPolicyData _privacyAndPolicyData;
  final GetSecurityRolesConfigData _securityRolesConfigData;
  void doIntent(MainProfileEvent event) {
    switch (event) {
      case MainProfileLogoutEvent():
        _logout();
      case MainProfileGetHelpDataEvent():
        _getHelpData();
      case MainProfileGetPrivacyAndPolicyEvent():
        _getPrivacyAndPolicyData();
      case MainProfileGetSecurityAndConfigEvent():
        _getSecurityConfigData();
      case MainProfileChangeLocalEvent():
        _changeLocal(event.value);
    }
  }

  ValueNotifier<bool> switcherLocal = ValueNotifier<bool>(false);
  void _changeLocal(bool value) {
    switcherLocal.value = value;
    final AppConfig provider = getIt.get<AppConfig>();
    if (value == true) {
      provider.changeLocal(ConstKeys.kArabicLocal);
    } else {
      provider.changeLocal(ConstKeys.kEnglishLocal);
    }
  }

  Future<void> _logout() async {
    emit(state.copyWith(logout: BaseState.loading()));
    final result = await _logoutUseCase.call();
    switch (result) {
      case ApiSuccessResult<LogoutResponseEntity>():
        emit(state.copyWith(logout: BaseState.success(result.data)));
      case ApiErrorResult<LogoutResponseEntity>():
        emit(state.copyWith(logout: BaseState.error(result.errorMessage)));
    }
  }

  Future<void> _getHelpData() async {
    emit(state.copyWith(helpData: BaseState.loading()));
    final result = await _helpDataUseCase.call();
    switch (result) {
      case ApiSuccessResult<HelpResponseEntity>():
        emit(state.copyWith(helpData: BaseState.success(result.data)));
      case ApiErrorResult<HelpResponseEntity>():
        emit(state.copyWith(helpData: BaseState.error(result.errorMessage)));
    }
  }

  Future<void> _getPrivacyAndPolicyData() async {
    emit(state.copyWith(privacyAndPolicyData: BaseState.loading()));
    final result = await _privacyAndPolicyData.call();
    switch (result) {
      case ApiSuccessResult<PrivacyPolicyResponseEntity>():
        emit(
          state.copyWith(privacyAndPolicyData: BaseState.success(result.data)),
        );
      case ApiErrorResult<PrivacyPolicyResponseEntity>():
        emit(state.copyWith(helpData: BaseState.error(result.errorMessage)));
    }
  }

  Future<void> _getSecurityConfigData() async {
    emit(state.copyWith(securityAndConfigData: BaseState.loading()));
    final result = await _securityRolesConfigData.call();
    switch (result) {
      case ApiSuccessResult<SecurityRolesConfigResponseEntity>():
        emit(
          state.copyWith(securityAndConfigData: BaseState.success(result.data)),
        );
      case ApiErrorResult<SecurityRolesConfigResponseEntity>():
        emit(
          state.copyWith(
            securityAndConfigData: BaseState.error(result.errorMessage),
          ),
        );
    }
  }
}
