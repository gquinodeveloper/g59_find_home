import 'package:g59_find_home/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    _goToLogin();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  _goToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.LOGIN);
    });
  }
}
