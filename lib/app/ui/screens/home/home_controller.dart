import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g59_find_home/app/data/models/response/response_auth_model.dart';
import 'package:g59_find_home/app/data/models/response/response_house_model.dart';
import 'package:g59_find_home/app/data/repositories/house_repository.dart';
import 'package:g59_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:g59_find_home/app/data/repositories/user_repository.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/condominum.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/houses.dart';
import 'package:g59_find_home/app/ui/widgets/snackbar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    _loadSession();

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
  final _storageRepository = Get.find<StorageRepository>();
  final _houseRepository = Get.find<HouseRepository>();
  final _userRepository = Get.find<UserRepository>();

  //variables
  ResponseAuthModel authModel = ResponseAuthModel();

  RxString name = RxString("");
  RxString address = RxString("");
  RxInt isSelectedIndex = RxInt(0);

  RxList<ResponseHouseModel> houses = RxList([]);

  //funciones
  _loadSession() async {
    authModel = await _storageRepository.readSession();
    _loadInformation();
    _loadHouse();
  }

  _loadHouse() async {
    try {
      houses.value = await _houseRepository.getHouses(authModel.requestToken);
    } on DioError catch (ex) {
      Snackbar.show(
        title: ex.error,
        message: ex.response?.data.toString() ?? "No found message",
        typeMessage: 1,
      );
    }
  }

  _loadInformation() async {
    try {
      final response = await _userRepository.getInformation(
        token: authModel.requestToken,
        idUser: authModel.idUser,
      );
      name.value = response.name;
      address.value = response.address ?? "No found direction";
    } on DioError catch (ex) {
      Snackbar.show(
        title: ex.error,
        message: ex.response?.data.toString() ?? "No found message",
        typeMessage: 1,
      );
    }
  }

  selectedIndex(int index) {
    isSelectedIndex.value = index;
  }

  Widget viewSeleted(int index) {
    isSelectedIndex.value = index;
    print(isSelectedIndex.value);
    switch (index) {
      case 1:
        return Houses();
      case 2:
        return Condominum();
      default:
        break;
    }
    return Houses();
  }
}
