import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  final _storage = GetStorage();

  //Genric method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //Genric method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  //Genric method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  //Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
