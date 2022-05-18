import 'package:dio/dio.dart';
import 'package:g59_find_home/app/core/config/app_config.dart';
import 'package:g59_find_home/app/data/models/response/response_house_model.dart';

class HouseProvider {
  final _dio = Dio();

  Future<List<ResponseHouseModel>> getHouses(String token) async {
    final response = await _dio.get(
      "$kBaseUrl/api/house/houses/1/6",
      options: Options(
        headers: {
          "auth": token,
        },
      ),
    );
    return (response.data["result"] as List)
        .map((json) => ResponseHouseModel.fromJson(json))
        .toList();
  }
}
