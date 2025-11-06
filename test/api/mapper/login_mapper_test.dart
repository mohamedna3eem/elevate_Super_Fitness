import 'package:elevate_super_fitness/api/mapper/login_mapper.dart';
import 'package:elevate_super_fitness/api/models/requests/login_request_dto.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy/login_dummy_data.dart';

void main() {
  group("test mapper function", () {
    final requestEntity = LoginDummyData.dummyLoginRequestEntity;
    final responseDto = LoginDummyData.dummyLoginResponseDto;
    final requestDto = requestEntity.toDto();
    final responseEntity = LoginDummyData.dummyLoginResponseEntity;
    test("test request entity --> to dto", () {
      //Act
      final result = requestEntity.toDto();
      //Assert
      expect(result, isA<LoginRequestDto>());
      expect(result.email, equals(requestDto.email));
      expect(result.password, equals(requestEntity.password));
    });
    test("test response dto --> entity", () {
      //Act
      final result = responseDto.toEntity();
      //Assert
      expect(result, isA<LoginResponseEntity>());
      expect(result.email, equals(responseEntity.email));
      expect(result.firstName, equals(responseEntity.firstName));
    });
  });
}
