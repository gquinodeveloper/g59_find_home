import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g59_find_home/app/data/models/request/request_user_model.dart';
import 'package:g59_find_home/app/data/repositories/user_repository.dart';
import 'package:g59_find_home/app/ui/widgets/snackbar.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //instance
  final _userRepository = Get.find<UserRepository>();

  //variables

  //TextEditingController
  TextEditingController txtControllerName = TextEditingController();
  TextEditingController txtControllerLastName = TextEditingController();
  TextEditingController txtControllerAddress = TextEditingController();
  TextEditingController txtControllerEmail = TextEditingController();
  TextEditingController txtControllerPassword = TextEditingController();

  //funciones
  goToLogin() {
    Get.back();
  }

  saveUser() async {
    try {
      final response = await _userRepository.insert(
        RequestUserModel(
            name: txtControllerName.text,
            lastname: txtControllerLastName.text,
            adress: txtControllerAddress.text,
            email: txtControllerEmail.text,
            password: txtControllerPassword.text),
      );
      if (response.isNotEmpty) {
        //msg
        Snackbar.show(
          title: "Success",
          message: response,
          isPositionTop: false,
          typeMessage: 0,
        );
        //limpiar controles
        _clearText();
      }
    } on DioError catch (ex) {
      Snackbar.show(
        title: ex.error,
        message: ex.response?.data.toString() ?? "No found message",
        typeMessage: 1,
      );
    }
  }

  void _clearText() {
    txtControllerName.clear();
    txtControllerLastName.clear();
    txtControllerAddress.clear();
    txtControllerEmail.clear();
    txtControllerPassword.clear();
  }
}
