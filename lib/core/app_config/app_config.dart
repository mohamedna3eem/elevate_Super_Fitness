import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfig extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage;

  String? _local;

  AppConfig(this._secureStorage);

  String? get local => _local;

  Future<void> saveLocal(String value) async {
    await _secureStorage.write(key: ConstKeys.kLocal, value: value);
    _local = value;
  }

  Future<void> getLocal() async {
    _local = await _secureStorage.read(key: ConstKeys.kLocal);
    notifyListeners();
  }

  Future<void> changeLocal(String value) async {
    await saveLocal(value);
    notifyListeners();
  }
}
