import 'package:g59_find_home/app/data/models/response/response_auth_model.dart';
import 'package:g59_find_home/app/data/providers/local/storage_provider.dart';
import 'package:get/get.dart';

class StorageRepository {
  final _apiProvider = Get.find<StorageProvider>();

  Future<void> writeSession(ResponseAuthModel authModel) =>
      _apiProvider.writeSession(authModel);

  Future<ResponseAuthModel> readSession() => _apiProvider.readSession();
}
