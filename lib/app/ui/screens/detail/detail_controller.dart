import 'package:g59_find_home/app/data/models/response/response_house_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    houseModel = Get.arguments as ResponseHouseModel;

    print(houseModel.name);
    print(houseModel.description);
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
  ResponseHouseModel houseModel = ResponseHouseModel();
  //variables

}
