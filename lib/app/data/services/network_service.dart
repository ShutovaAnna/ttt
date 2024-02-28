import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  var client= Dio(BaseOptions(baseUrl:'https://ttt.bulbaman.me/'));
  Future<NetworkService> init() async {
    return this;
  }

Future<bool> registration (String nick) async {
  try {
    var response = await client.post("user/add/$nick");
    print(response.data);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
  
}
}