import 'package:g59_find_home/app/data/models/request/request_user_model.dart';
import 'package:g59_find_home/app/data/models/response/response_user_model.dart';
import 'package:g59_find_home/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<String> insert(RequestUserModel userModel) =>
      _apiProvider.insert(userModel);

  Future<ResponseUserModel> getInformation({
    required String token,
    required int idUser,
  }) =>
      _apiProvider.getInformation(
        token: token,
        idUser: idUser,
      );
}
