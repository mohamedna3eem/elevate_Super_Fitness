import 'package:elevate_super_fitness/api/data_source/auth_local_data_source_impl.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/auth_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_local_data_source_impl_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  group("test auth local data source", () {
    late FlutterSecureStorage secureStorage;
    late AuthLocalDataSource authLocalDataSource;
    setUp(() {
      secureStorage = MockFlutterSecureStorage();
      authLocalDataSource = AuthLocalDataSourceImpl(secureStorage);
    });
    test("save rememberMe function", () async {
      //Arrange
      when(
        secureStorage.write(key: "", value: anyNamed('value')),
      ).thenAnswer((_) async => Future.value());
      //Act
      await authLocalDataSource.saveUserRememberMe(rememberMe: true);
      //Assert
      verify(
        secureStorage.write(
          key: ConstKeys.keyRememberMe,
          value: true.toString(),
        ),
      ).called(1);
    });
    test("save userToken function", () async {
      //Arrange
      when(
        secureStorage.write(
          key: "key",
          value: anyNamed('value'),
        ),
      ).thenAnswer((_) async {});
      //Act
      await authLocalDataSource.saveUserToken(token: "fake_token");
      //Assert
      verify(
        secureStorage.write(key: ConstKeys.keyUserToken, value: "fake_token"),
      ).called(1);
    });
    test("save login data function", () async {
      //Arrange
      when(
        secureStorage.write(
          key: "key",
          value: anyNamed('value')
        ),
      ).thenAnswer((_) async {});
      //Act
      await authLocalDataSource.saveLoginData(
        token: "fake_token",
        rememberMe: true,
      );
      //Assert
      verify(authLocalDataSource.saveUserToken(token: "fake_token")).called(1);
      verify(
        authLocalDataSource.saveUserRememberMe(rememberMe: true),
      ).called(1);
    });
  });
}
