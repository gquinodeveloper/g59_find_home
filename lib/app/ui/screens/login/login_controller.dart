import 'package:dio/dio.dart';
import 'package:g59_find_home/app/data/repositories/auth_repository.dart';
import 'package:g59_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:g59_find_home/app/routes/app_routes.dart';
import 'package:g59_find_home/app/ui/widgets/load_spinner.dart';
import 'package:g59_find_home/app/ui/widgets/snackbar.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //instance
  final _authRepository = Get.find<AuthRepository>();
  final _storageRepository = Get.find<StorageRepository>();

  //variables
  String email = "gqcrispin@gmail.com";
  String password = "123456";

  RxBool isObscureText = RxBool(true);

  //funciones
  void onChangeEmail(String value) => email = value;
  void onChangePassword(String value) => password = value;

  showPassword(){
    isObscureText.value = !isObscureText.value;
  }

  doAuth() async {
    try {
      LoadSpinner.show();
      final response = await _authRepository.auth(
        email: email,
        password: password,
      );
      LoadSpinner.hide();
      if(response.success){
        await _storageRepository.writeSession(response);
        Get.offNamed(AppRoutes.HOME);
      }
    } on DioError catch (ex) {
      Snackbar.show(
        title: ex.error,
        message: ex.response?.data.toString()?? "No found message",
        typeMessage: 1,
      );
    }
  }

  goToRegister(){
    Get.toNamed(AppRoutes.REGISTER);
  }
}
