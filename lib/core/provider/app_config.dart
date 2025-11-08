import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/const_keys.dart';
import '../di/di.dart';

class AppConfigProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = getIt.get<FlutterSecureStorage>();

  String? _local;
  Locale _locale = const Locale('en');

  String? get local => _local;
  Locale get locale => _locale;

  Future<void> saveLocal(String value) async {
    await _secureStorage.write(key: ConstKeys.local, value: value);
    _local = value;
    _locale = Locale(value);
  }

  Future<void> getLocal() async {
    _local = await _secureStorage.read(key: ConstKeys.local) ?? 'en';
    _locale = Locale(_local!);
    notifyListeners();
  }

  Future<void> changeLocal(String value) async {
    await saveLocal(value);
    notifyListeners();
  }
}
