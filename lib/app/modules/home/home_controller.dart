import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/data/services/network_service.dart';

class HomeController extends GetxController {
 
var textFieldCtrl = TextEditingController();
final _networkService = Get.find<NetworkService>();

auth() async {
  String nickname = textFieldCtrl.text;
  var regResult = false;
  await _networkService.registration(nickname);
  if (!regResult) {
    Get.showSnackbar(const GetSnackBar(
      title: 'регистрация неуспешна',
      message: 'удачи',
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    ));
  }
  print(nickname);
}
}
