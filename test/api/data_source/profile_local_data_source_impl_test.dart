import 'package:elevate_super_fitness/api/data_source/profile_local_data_source_impl.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/profile_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_local_data_source_impl_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  group("test profile local data source", () {
    late FlutterSecureStorage secureStorage;
    late ProfileLocalDataSource profileLocalDataSource;
    setUp(() {
      secureStorage = MockFlutterSecureStorage();
      profileLocalDataSource = ProfileLocalDataSourceImpl(secureStorage);
    });
    test("save userToken function", () async {
      //Arrange
      when(
        secureStorage.write(key: "key", value: anyNamed('value')),
      ).thenAnswer((_) async {});
      //Act
      await profileLocalDataSource.saveUserToken(token: "fake_token");
      //Assert
      verify(
        secureStorage.write(key: ConstKeys.keyUserToken, value: "fake_token"),
      ).called(1);
    });
  });
}
