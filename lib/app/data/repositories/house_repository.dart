import 'package:g59_find_home/app/data/models/response/response_house_model.dart';
import 'package:g59_find_home/app/data/providers/house_provider.dart';
import 'package:get/get.dart';

class HouseRepository {
  final _apiProvider = Get.find<HouseProvider>();

  Future<List<ResponseHouseModel>> getHouses(String token) =>
      _apiProvider.getHouses(token);
}
