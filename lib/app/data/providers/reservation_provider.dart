import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:g59_find_home/app/core/config/app_config.dart';
import 'package:g59_find_home/app/data/models/request/request_reservation_model.dart';

class ReservationProvider {
  final _dio = Dio();

  Future<String> register({
    required String token,
    required RequestReservationModel reservationModel,
  }) async {
    final response = await _dio.post(
      "$kBaseUrl/api/reservation/register",
      options: Options(
        headers: {
          "auth": token,
        },
      ),
      data: json.encode(reservationModel.toJson()),
    );

    return response.data["message"];
  }
}
