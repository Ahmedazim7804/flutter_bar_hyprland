import 'package:bar/streams/datetime_stream.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({super.key});

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  bool _showDate = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _showDate = !_showDate;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade900,
          ),
          child: StreamBuilder<DateTime>(
              stream: DateTimeStream().eventListener,
              initialData: DateTime.now(),
              builder: (context, snapshot) {
                late final String text;

                if (_showDate) {
                  text = DateFormat('E, d MMM').format(snapshot.data!);
                } else {
                  text = DateFormat('HH:mm:ss').format(snapshot.data!);
                }

                return Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                );
              }),
        ));
  }
}
