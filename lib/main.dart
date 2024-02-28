import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ttt/app/data/services/network_service.dart';
import 'package:ttt/app/data/services/storage_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await GetStorage.init('main');
Get.putAsync(() => StorageService().init());
Get.putAsync(() => NetworkService().init());
}