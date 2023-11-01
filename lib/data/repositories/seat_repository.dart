import 'package:tpop/core/network/api_service.dart';
import 'package:tpop/domain/models/seat_layout.dart';

class SeatRepository {
  final ApiService _apiService = ApiService();

  Future<SeatLayout> fetchSeatLayout() async {
    try {
      final jsonData = await _apiService.fetchSeatData();
      return SeatLayout.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to fetch seat data');
    }
  }
}
