import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:g59_find_home/app/core/config/app_config.dart';
import 'package:g59_find_home/app/data/models/response/response_auth_model.dart';
import 'package:get/get.dart';

class StorageProvider {
  final storage = Get.find<FlutterSecureStorage>();

  Future<void> writeSession(ResponseAuthModel authModel) async {
    await storage.write(key: kKeySession, value: jsonEncode(authModel.toJson()));
  }

  Future<ResponseAuthModel> readSession() async{
    String value = await storage.read(key: kKeySession)??"";
    return ResponseAuthModel.fromJson(jsonDecode(value));
  }
}
