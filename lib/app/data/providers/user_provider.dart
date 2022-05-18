import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:g59_find_home/app/core/config/app_config.dart';
import 'package:g59_find_home/app/data/models/request/request_user_model.dart';
import 'package:g59_find_home/app/data/models/response/response_user_model.dart';

class UserProvider {
  final _dio = Dio();

  Future<String> insert(RequestUserModel userModel) async {
    final response = await _dio.post(
      kBaseUrl + "/api/user/register",
      data: json.encode(userModel.toJson()),
    );

    return response.data["message"];
  }

  Future<ResponseUserModel> getInformation({
    required String token,
    required int idUser,
  }) async {
    final response = await _dio.get(
      kBaseUrl + "/api/user/information/$idUser",
      options: Options(
        headers: {
          "auth": token,
        },
      ),
    );
    return (response.data["information"] as List)
        .map((json) => ResponseUserModel.fromJson(json))
        .toList()[0];
  }
}
