abstract interface class ProfileLocalDataSource {
  Future<void> saveUserToken({required String token});
}
