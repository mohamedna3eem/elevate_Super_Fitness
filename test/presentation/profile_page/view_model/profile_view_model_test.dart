import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_events.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_view_model.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_states.dart';
import 'package:elevate_super_fitness/domain/use_cases/profile_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/logout_use_case.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';
import '../../../dummy/profile_dummy_data.dart';
import 'profile_view_model_test.mocks.dart';

@GenerateMocks([ProfileUseCase, LogoutUseCase])
void main() {
  late MockProfileUseCase mockProfileUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late ProfileViewModel viewModel;

  setUp(() {
    mockProfileUseCase = MockProfileUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    viewModel = ProfileViewModel(mockProfileUseCase, mockLogoutUseCase);

    // 🚀 Provide dummy values for Mockito generic types
    provideDummy<ApiResult<ProfileResponseEntity>>(
        ApiSuccessResult(ProfileDummyData.dummyProfileResponseEntity));
    provideDummy<ApiResult<LogOutResponseEntity>>(
        ApiSuccessResult(LogOutResponseEntity(message: 'dummy')));
  });

  group('ProfileViewModel - getProfileData', () {
    final dummyProfile = ProfileDummyData.dummyProfileResponseEntity;

    test('emits loading and success when getProfileData succeeds', () async {
      when(mockProfileUseCase()).thenAnswer(
            (_) async => ApiSuccessResult(dummyProfile),
      );

      final states = <ProfileStates>[];
      final subscription = viewModel.stream.listen(states.add);

       viewModel.doIntent(ProfileEvent());

      await Future.delayed(Duration.zero);

      expect(states[0].status, ProfileStatus.loading);
      expect(states[1].status, ProfileStatus.success);
      expect(states[1].profileResponseEntity, dummyProfile);

      await subscription.cancel();
    });

    test('emits loading and error when getProfileData fails', () async {
      when(mockProfileUseCase()).thenAnswer(
            (_) async => ApiErrorResult(Exception('Failed')),
      );

      final states = <ProfileStates>[];
      final subscription = viewModel.stream.listen(states.add);

       viewModel.doIntent(ProfileEvent());

      await Future.delayed(Duration.zero);

      expect(states[0].status, ProfileStatus.loading);
      expect(states[1].status, ProfileStatus.error);
      expect(states[1].errorMessage, isNotNull);

      await subscription.cancel();
    });
  });

  group('ProfileViewModel - logout', () {
    final dummyLogout = LogOutResponseEntity(message: 'Logged out');

    test('emits loading and success when logout succeeds', () async {
      when(mockLogoutUseCase()).thenAnswer(
            (_) async => ApiSuccessResult(dummyLogout),
      );

      final states = <ProfileStates>[];
      final subscription = viewModel.stream.listen(states.add);

       viewModel.doIntent(LogoutEvent());

      await Future.delayed(Duration.zero);

      expect(states[0].status, ProfileStatus.loading);
      expect(states[1].status, ProfileStatus.success);
      expect(states[1].logOutResponseEntity, dummyLogout);

      await subscription.cancel();
    });

    test('emits loading and error when logout fails', () async {
      when(mockLogoutUseCase()).thenAnswer(
            (_) async => ApiErrorResult(Exception('Logout failed')),
      );

      final states = <ProfileStates>[];
      final subscription = viewModel.stream.listen(states.add);

       viewModel.doIntent(LogoutEvent());

      await Future.delayed(Duration.zero);

      expect(states[0].status, ProfileStatus.loading);
      expect(states[1].status, ProfileStatus.error);
      expect(states[1].errorMessage, isNotNull);

      await subscription.cancel();
    });
  });
}
