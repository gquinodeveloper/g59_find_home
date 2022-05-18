import 'package:dio/dio.dart';
import 'package:g59_find_home/app/core/config/app_config.dart';
import 'package:g59_find_home/app/data/models/response/response_auth_model.dart';

class AuthProvider {
  final _dio = Dio();

  Future<ResponseAuthModel> auth({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      kBaseUrl + "/api/user/auth",
      data: {
        "email": email,
        "password": password,
      },
    );

    return ResponseAuthModel.fromJson(response.data);
  }
}
