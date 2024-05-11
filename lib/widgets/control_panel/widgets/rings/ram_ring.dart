import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RamRingWidget extends StatelessWidget {
  const RamRingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
        radius: 60,
        percent: 0.6,
        progressColor: const Color(0xFF7BA5DD),
        animation: true,
        circularStrokeCap: CircularStrokeCap.round,
        animateFromLastPercent: true,
        lineWidth: 16,
        center: const Text(
          'Ram\n60%',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ));
  }
}
