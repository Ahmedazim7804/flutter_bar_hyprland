import 'package:bar/streams/battery_stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PowerWidget extends StatelessWidget {
  const PowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 150,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              width: 75,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "45%",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
