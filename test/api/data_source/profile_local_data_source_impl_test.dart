import 'package:elevate_super_fitness/api/client/local_data.dart';
import 'package:elevate_super_fitness/api/data_source/profile_local_data_source_impl.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/profile_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_local_data_source_impl_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage, LocalData])
void main() {
  group("test profile local data source", () {
    late FlutterSecureStorage secureStorage;
    late ProfileLocalDataSource profileLocalDataSource;
    late LocalData localData;
    setUp(() {
      secureStorage = MockFlutterSecureStorage();
      localData = MockLocalData();
      profileLocalDataSource = ProfileLocalDataSourceImpl(
        secureStorage,
        localData,
      );
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
    test("delete userToken function", () async {
      //Arrange
      when(secureStorage.delete(key: "key")).thenAnswer((_) async {});
      //Act
      await profileLocalDataSource.deleteTokenToken(
        key: ConstKeys.keyUserToken,
      );
      //Assert
      verify(secureStorage.delete(key: ConstKeys.keyUserToken)).called(1);
    });
    test("delete rememberMe function", () async {
      //Arrange
      when(secureStorage.delete(key: "key")).thenAnswer((_) async {});
      //Act
      await profileLocalDataSource.deleteRememberMe(
        key: ConstKeys.keyRememberMe,
      );
      //Assert
      verify(secureStorage.delete(key: ConstKeys.keyRememberMe)).called(1);
    });
  });
}
