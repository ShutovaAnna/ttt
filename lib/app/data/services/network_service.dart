import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  var client = Dio(BaseOptions(baseUrl: 'https://ttt.bulbaman.me/'));

  Rx<NewUser?> user = null.obs;

  Future<NetworkService> init() async {
    return this;
  }

  Future<bool> registration(String nick) async {
    try {
      var response = await client.post("user/add/$nick");
      var newUser = NewUser.fromJson(response.data);
      print(newUser);
      user = newUser;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
