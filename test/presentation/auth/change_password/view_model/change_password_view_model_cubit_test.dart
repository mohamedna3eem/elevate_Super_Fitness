import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/core/enums/change_password.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/change_password_use_case.dart';
import 'package:elevate_super_fitness/presentation/auth/change_password/view_model/change_password_event.dart';
import 'package:elevate_super_fitness/presentation/auth/change_password/view_model/change_password_view_model_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy/profile_dummy_data.dart';
import 'change_password_view_model_cubit_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() {
  group("test change password view model", () {
    late ChangePasswordUseCase useCase;
    late ChangePasswordViewModel changePasswordViewModel;
    late ChangePasswordViewModelState changePasswordState;
    final requestEntity = ProfileDummyData.dummyChangePasswordRequestEntity;
    final responseEntity = ProfileDummyData.dummyChangePasswordResponseEntity;
    final responseError = ProfileDummyData.dummyException;
    setUp(() {
      useCase = MockChangePasswordUseCase();
      changePasswordViewModel = ChangePasswordViewModel(useCase);
      changePasswordState = const ChangePasswordViewModelState();
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiSuccessResult(responseEntity),
      );
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiErrorResult(responseError),
      );
    });
    blocTest(
      "test emit success function changePassword()",
      build: () {
        when(useCase.call(requestEntity)).thenAnswer(
          (_) async =>
              ApiSuccessResult<ChangePasswordResponseEntity>(responseEntity),
        );
        return changePasswordViewModel;
      },
      act: (cubit) =>
          cubit.doIntent(ChangePasswordExecuteEvent(request: requestEntity)),
      expect: () => [
        changePasswordState.copyWith(
          changePasswordResponse:
              BaseState<ChangePasswordResponseEntity>.loading(),
        ),
        changePasswordState.copyWith(
          changePasswordResponse:
              BaseState<ChangePasswordResponseEntity>.success(responseEntity),
        ),
      ],
      verify: (bloc) {
        verify(useCase.call(requestEntity)).called(1);
      },
    );
    blocTest(
      "test emit error function changePassword()",
      build: () {
        when(useCase.call(requestEntity)).thenAnswer(
          (_) async =>
              ApiErrorResult<ChangePasswordResponseEntity>(responseError),
        );
        return changePasswordViewModel;
      },
      act: (cubit) =>
          cubit.doIntent(ChangePasswordExecuteEvent(request: requestEntity)),
      expect: () => [
        changePasswordState.copyWith(
          changePasswordResponse:
              BaseState<ChangePasswordResponseEntity>.loading(),
        ),
        changePasswordState.copyWith(
          changePasswordResponse: BaseState<ChangePasswordResponseEntity>.error(
            responseError.toString(),
          ),
        ),
      ],
      verify: (bloc) {
        verify(useCase.call(requestEntity)).called(1);
      },
    );
    test("test show password", () {
      //Arrange
      changePasswordViewModel.showOldPassword = ValueNotifier(true);
      //Act
      changePasswordViewModel.doIntent(
        ChangePasswordShowIconEvent(
          enumEvent: ChangePasswordEnum.confirmPassword,
        ),
      );
      //Assert
      expect(changePasswordViewModel.showConfirmPassword.value, equals(false));
    });
  });
}
