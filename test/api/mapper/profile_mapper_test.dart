import 'package:elevate_super_fitness/api/mapper/profile_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../dummy/profile_dummy_data.dart';

void main() {
  group('🧩 Mapper Tests using ProfileDummyData', () {
    test('UserInfoMapper converts UserInfoDto → UserInfoEntity correctly', () {
      // Arrange
      final dto = ProfileDummyData.dummyUserInfoDto;

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity, equals(ProfileDummyData.dummyUserInfoEntity));
    });

    test('ChangePasswordResponseMapper converts DTO → Entity correctly', () {
      // Arrange
      final dto = ProfileDummyData.dummyChangePasswordResponseDto;

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(
        entity,
        equals(ProfileDummyData.dummyChangePasswordResponseEntity),
      );
    });

    test(
      'ChangePasswordRequestEntityMapper converts Entity → DTO correctly',
      () {
        // Arrange
        final entity = ProfileDummyData.dummyChangePasswordRequestEntity;

        // Act
        final dto = entity.toDto();

        // Assert
        expect(dto, equals(ProfileDummyData.dummyChangePasswordRequestDto));
      },
    );

    test(
      'UserInfoDto.toEntity() result matches dummyUserInfoEntityMappedToEntity',
      () {
        // Act
        final mappedEntity = ProfileDummyData.dummyUserInfoDto.toEntity();

        // Assert
        expect(mappedEntity, equals(ProfileDummyData.dummyUserInfoEntity));
      },
    );
    test('maps LogoutResponseDto → LogoutResponseEntity correctly', () {
      final dto = ProfileDummyData.dummyLogoutResponseDto;
      final entity = dto.toEntity();

      expect(entity, equals(ProfileDummyData.dummyLogoutResponseEntity));
    });
  });
}
