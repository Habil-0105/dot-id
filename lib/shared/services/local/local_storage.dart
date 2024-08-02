import 'dart:convert';
import 'package:dot/shared/utils/constants/storage_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage{
  LocalStorage._(){
    _storage = const FlutterSecureStorage();
    _box = _initSecureBox;
  }

  static LocalStorage get instance => LocalStorage._();

  late final FlutterSecureStorage _storage;
  late final Future<Box> _box;

  Future<Box> get _initSecureBox async{
    String encryptedKey = await _storage.read(key: StorageKey.encryptedKey) ?? '';

    if(encryptedKey.isEmpty){
      final key = Hive.generateSecureKey();
      await _storage.write(key: StorageKey.encryptedKey, value: base64UrlEncode(key));
      encryptedKey = (await _storage.read(key: StorageKey.encryptedKey))!;
    }

    final encryptionKeyUint8List = base64Url.decode(encryptedKey);
    return await Hive.openBox(StorageKey.box, encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  }

  Future<void> setData<T>(String key, T value)async{
    (await _box).put(key, value);
  }

  Future<String> get expenses async => (await _box).get(StorageKey.expenses) ?? "";
}