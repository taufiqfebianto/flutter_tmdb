import 'package:hive/hive.dart';

enum StorageConstants {
  user,
  setting,
}

class Storage {
  Storage();

  Future<void> putString(
      {required String? boxName,
      required String? key,
      required String? value}) async {
    Box box = await Hive.openBox(boxName!);
    await box.put(key, value);
    await box.close();
    return;
  }

  Future<void> putBool(
      {required String? boxName,
      required String? key,
      required bool? value}) async {
    Box box = await Hive.openBox(boxName!);
    await box.put(key, value);
    await box.close();
    return;
  }

  Future<String> getString(
      {required String? boxName, required String? key}) async {
    Box box = await Hive.openBox(boxName!);
    String value = await box.get(key);
    await box.close();
    return value;
  }

  Future<bool> getBool({required String? boxName, required String? key}) async {
    Box box = await Hive.openBox(boxName!);
    bool value = await box.get(key);
    await box.close();
    return value;
  }

  Future<void> deleteData({required String? boxName}) async {
    Box box = await Hive.openBox(boxName!);
    await box.deleteFromDisk();
    await box.close();
    return;
  }
}

final storage = Storage();
