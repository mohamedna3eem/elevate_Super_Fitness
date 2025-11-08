import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';

void main() {
  group('ProfileStates', () {
    final dummyProfile = ProfileResponseEntity(
      message: 'Profile loaded',
      user: null,
    );

    final dummyLogout = LogOutResponseEntity(
      message: 'Logged out successfully',
    );

    test('supports value equality', () {
      final state1 = const ProfileStates();
      final state2 = const ProfileStates();

      expect(state1, state2);
    });

    test('copyWith returns same object if no params passed', () {
      final state = const ProfileStates();
      final copied = state.copyWith();

      expect(copied, state);
    });

    test('copyWith updates properties correctly', () {
      final state = const ProfileStates();
      final updated = state.copyWith(
        status: ProfileStatus.success,
        profileResponseEntity: dummyProfile,
        errorMessage: 'Error occurred',
        logOutResponseEntity: dummyLogout,
      );

      expect(updated.status, ProfileStatus.success);
      expect(updated.profileResponseEntity, dummyProfile);
      expect(updated.errorMessage, 'Error occurred');
      expect(updated.logOutResponseEntity, dummyLogout);
    });

    test('copyWith only updates provided properties', () {
      final state = const ProfileStates(
        status: ProfileStatus.loading,
        errorMessage: 'Initial error',
      );

      final updated = state.copyWith(
        status: ProfileStatus.success,
      );

      expect(updated.status, ProfileStatus.success);
      expect(updated.errorMessage, 'Initial error');
      expect(updated.profileResponseEntity, null);
      expect(updated.logOutResponseEntity, null);
    });
  });
}
