import 'package:bar/bloc/cubit/battery_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rainbow_color/rainbow_color.dart';

class PowerWidget extends StatelessWidget {
  const PowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: BlocBuilder<BatteryCubit, BatteryState>(
        builder: (context, state) {
          if (state is BatteryStateCharging) {
            return BatteryChargingWidget(percentage: state.battery.percentage);
          } else {
            return BatteryDischargingWidget(
                percentage: state.battery.percentage);
          }
        },
      ),
    );
  }
}

class BatteryChargingWidget extends StatelessWidget {
  const BatteryChargingWidget({super.key, required this.percentage});
  final Color color = const Color(0xFF02C67D);
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.bolt_rounded,
          color: color,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: percentage,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${percentage.toInt()}%",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class BatteryDischargingWidget extends StatelessWidget {
  const BatteryDischargingWidget({super.key, required this.percentage});

  final double percentage;

  IconData getBatteryIcon() {
    if (percentage <= 5) {
      return Icons.battery_0_bar_rounded;
    } else if (percentage <= 20) {
      return Icons.battery_1_bar_rounded;
    } else if (percentage <= 35) {
      return Icons.battery_2_bar_rounded;
    } else if (percentage <= 45) {
      return Icons.battery_3_bar_rounded;
    } else if (percentage <= 55) {
      return Icons.battery_4_bar_rounded;
    } else if (percentage <= 75) {
      return Icons.battery_5_bar_rounded;
    } else if (percentage <= 90) {
      return Icons.battery_6_bar_rounded;
    } else {
      return Icons.battery_full_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Rainbow rainbow = Rainbow(
      spectrum: [
        Colors.red.shade900,
        Colors.red.shade800,
        const Color(0xFFc05d0c),
        const Color(0xFFd8690d),
        const Color(0xFF019e64),
        const Color(0xFF01b270),
        const Color(0xFF02c67d),
        // Colors.greenAccent.shade200,
        // Colors.greenAccent.shade400,
        // Colors.greenAccent.shade700,
        // const Color(0xFF02C67D),
        // Colors.lightGreen,
      ],
      rangeStart: 0,
      rangeEnd: 100,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          getBatteryIcon(),
          color: rainbow[percentage],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: percentage.toInt() * 1.5,
                decoration: BoxDecoration(
                  color: rainbow[percentage],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${percentage.toInt()}%",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
  }
}
