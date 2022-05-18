import 'package:g59_find_home/app/data/models/response/response_auth_model.dart';
import 'package:g59_find_home/app/data/providers/auth_provider.dart';
import 'package:get/get.dart';

class AuthRepository {
  final _apiProvider = Get.find<AuthProvider>();

  Future<ResponseAuthModel> auth({
    required String email,
    required String password,
  }) =>
      _apiProvider.auth(email: email, password: password);
}
