// lib/domain/models/seat_layout.dart
class SeatLayout {
  final int rows;
  final int columns;
  final List<Seat> seats;

  SeatLayout({
    required this.rows,
    required this.columns,
    required this.seats,
  });

  factory SeatLayout.fromJson(Map<String, dynamic> json) {
    final seatLayoutData = json['seatLayout'];
    final List<dynamic> seatsData = seatLayoutData['seats'];

    final seatsList = seatsData.map((seatData) {
      return Seat(
        seatNumber: seatData['seatNumber'],
        status: seatData['status'],
      );
    }).toList();

    return SeatLayout(
      rows: seatLayoutData['rows'],
      columns: seatLayoutData['columns'],
      seats: seatsList,
    );
  }
}

class Seat {
  final String seatNumber;
  final String status;

  Seat({
    required this.seatNumber,
    required this.status,
  });
}
