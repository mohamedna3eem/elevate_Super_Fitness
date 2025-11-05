abstract interface class AuthLocalDataSource {
  Future<void> saveUserToken({required String token});
  Future<void> saveUserRememberMe({required bool rememberMe});
  Future<void> saveLoginData({required String token, required bool rememberMe});
}
