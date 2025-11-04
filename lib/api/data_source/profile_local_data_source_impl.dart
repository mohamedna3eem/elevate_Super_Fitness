import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/profile_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final FlutterSecureStorage _secureStorage;

  ProfileLocalDataSourceImpl(this._secureStorage);
  Future<void> _saveValue({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> saveUserToken({required String token}) {
    return _saveValue(key: ConstKeys.keyUserToken, value: token);
  }
}
