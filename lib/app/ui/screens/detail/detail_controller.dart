import 'package:dio/dio.dart';
import 'package:g59_find_home/app/data/models/request/request_reservation_model.dart';
import 'package:g59_find_home/app/data/models/response/response_auth_model.dart';
import 'package:g59_find_home/app/data/models/response/response_house_model.dart';
import 'package:g59_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:g59_find_home/app/data/repositories/reservation_repository.dart';
import 'package:g59_find_home/app/ui/widgets/load_spinner.dart';
import 'package:g59_find_home/app/ui/widgets/snackbar.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    _loadSession();
    houseModel = Get.arguments as ResponseHouseModel;
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

  //instancias
  final _storageRepository = Get.find<StorageRepository>();
  final _reservationRepository = Get.find<ReservationRepository>();

  ResponseHouseModel houseModel = ResponseHouseModel();
  ResponseAuthModel authModel = ResponseAuthModel();

  //variables
  String _date = "";


  //Funciones
  void onChangeDate(String value) => _date = value;

  _loadSession() async {
    authModel = await _storageRepository.readSession();
  }

  save() async {
    try {
      LoadSpinner.show();
      final response = await _reservationRepository.register(
        token: authModel.requestToken,
        reservationModel: RequestReservationModel(
          idUser: authModel.idUser,
          idHouse: houseModel.idHouse,
          date: _date,
          price: houseModel.price.toString(),
        ),
      );
      LoadSpinner.hide();
      Get.back();
      if (response.isNotEmpty) {
        //msg
        Snackbar.show(
          title: "Success",
          message: response,
          isPositionTop: false,
          typeMessage: 0,
        );
      }
    } on DioError catch (ex) {
      Snackbar.show(
        title: ex.error,
        message: ex.response?.data.toString() ?? "No found message",
        typeMessage: 1,
      );
    }
  }
}
