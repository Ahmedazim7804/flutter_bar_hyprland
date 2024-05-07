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
        late final Color color;

        if (state is BatteryStateCharging) {
          color = const Color(0xFF02C67D);
        } else if (state is BatteryStateDischarging) {
          color = Colors.red;
        } else {
          color = Colors.grey;
        }

        return PowerWidgetContent(
            color: color, percentage: state.battery.percentage);
      },
    );
  }
}

class PowerWidgetContent extends StatelessWidget {
  const PowerWidgetContent(
      {super.key, required this.color, required this.percentage});
  final Color color;
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
