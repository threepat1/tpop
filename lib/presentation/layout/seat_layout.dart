import 'package:flutter/material.dart';
import 'package:tpop/domain/models/seat_layout.dart';

class SeatLayoutWidget extends StatefulWidget {
  final SeatLayout seatLayout;

  const SeatLayoutWidget(this.seatLayout, {super.key});

  @override
  _SeatLayoutWidgetState createState() => _SeatLayoutWidgetState();
}

class _SeatLayoutWidgetState extends State<SeatLayoutWidget> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    final int rows = widget.seatLayout.rows;
    final int columns = widget.seatLayout.columns;
    final List<Seat> seats = widget.seatLayout.seats;

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns + 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              if (index < columns + 1) {
                // Display seat numbers 1-5 in the first row
                if (index == 0) {
                  return Center(child: Text(''));
                } else {
                  return Center(child: Text('$index'));
                }
              } else if (index % (columns + 1) == 0) {
                // Display row labels (A, B, C, ...) on the left
                final rowLabel = String.fromCharCode(
                    'A'.codeUnitAt(0) + (index ~/ (columns + 1) - 1));
                return Center(
                  child: Text(rowLabel),
                );
              } else {
                final seatIndex = index - (index ~/ (columns + 1)) - 1;
                final seat = seats[seatIndex];
                final status = seat.status;
                final isSelected = selectedSeats.contains(seat.seatNumber);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedSeats.remove(seat.seatNumber);
                      } else {
                        selectedSeats.add(seat.seatNumber);
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(3.0), // Margin of 3 pixels
                    child: Container(
                      color: isSelected
                          ? Colors.orange
                          : (status == 'available' ? Colors.grey : Colors.red),
                    ),
                  ),
                );
              }
            },
            itemCount: (columns + 1) * rows,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ที่นั่ง'),
                Row(
                  children: selectedSeats
                      .map((seatNumber) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                color: Colors.black,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '$seatNumber',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Remove the seat number from the list when tapped
                                          setState(() {
                                            selectedSeats.remove(seatNumber);
                                          });
                                        },
                                        child: Text(
                                          'x',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
