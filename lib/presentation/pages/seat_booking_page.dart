import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tpop/data/repositories/seat_repository.dart';
import 'package:tpop/domain/models/seat_layout.dart';
import 'package:tpop/presentation/layout/seat_layout.dart';

class SeatBookingScreen extends StatefulWidget {
  @override
  _SeatBookingScreenState createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  late SeatLayout seatLayout;

  @override
  void initState() {
    super.initState();
    fetchSeatData();
  }

  Future<void> fetchSeatData() async {
    try {
      seatLayout = await SeatRepository().fetchSeatLayout();
      setState(() {});
    } catch (e) {
      // Handle the error
      print('Failed to load data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seat Booking App'),
      ),
      body: SeatLayoutWidget(seatLayout),
    );
  }
}
