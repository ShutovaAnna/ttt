import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage box;

  Future<StorageService> init() async {
    await GetStorage.init('main');
    box = GetStorage('box');
    return this;
  }

  Future<void> writeUserData (NewUser data) async {
    var jsonData = data.toJson();
    var stringData = jsonEncode(jsonData);
    await box.write('userData', stringData);
  }

  NewUser? readUserData() {
    String? stringData = box.read<String>('userData');
    Map <String, dynamic> jsonData = jsonDecode(stringData);
    newUser data = NewUser.fromJson(jsonData);
    print(data);
  } 
}