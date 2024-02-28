import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  var client = Dio(BaseOptions(baseUrl: 'https://ttt.bulbaman.me/'));

  NewUser? user;

  Future<NetworkService> init() async {
    await readPrefs();
    return this;
  }

Future<void> readPrefs() async {
  var userReaded = await storage.readUserData();
}

  Future<bool> registration(String nick) async {
    try {
      var response = await client.post("user/add/$nick");
      var newUser = NewUser.fromJson(response.data);
      user.value = newUser;
      print(newUser);
      await storage.writeUserData(newUser);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
