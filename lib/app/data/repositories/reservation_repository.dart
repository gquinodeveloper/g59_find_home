import 'package:g59_find_home/app/data/models/request/request_reservation_model.dart';
import 'package:g59_find_home/app/data/providers/reservation_provider.dart';
import 'package:get/get.dart';

class ReservationRepository {
  final _apiProvider = Get.find<ReservationProvider>();

  Future<String> register({
    required String token,
    required RequestReservationModel reservationModel,
  }) =>
      _apiProvider.register(
        token: token,
        reservationModel: reservationModel,
      );
}
