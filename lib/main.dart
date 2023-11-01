import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tpop/presentation/pages/seat_booking_page.dart';

void main() {
  runApp(SeatBookingApp());
}

class SeatBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeatBookingScreen(),
    );
  }
}
