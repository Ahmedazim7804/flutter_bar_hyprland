import 'package:bar/bloc/cubit/battery_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PowerWidget extends StatelessWidget {
  const PowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BatteryCubit, BatteryState>(
      builder: (context, state) {
        if (state is BatteryStateCharging) {
          return BatteryChargingWidget(percentage: state.battery.percentage);
        } else {
          return BatteryDischargingWidget(percentage: state.battery.percentage);
        }
      },
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
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: percentage.toInt() * 1.5,
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
  final Color color = Colors.grey;
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          getBatteryIcon(),
          color: color,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: percentage.toInt() * 1.5,
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
