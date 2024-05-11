import 'package:bar/widgets/bluetooth_widget.dart';
import 'package:bar/widgets/brightness_widget.dart';
import 'package:bar/widgets/network_widget.dart';
import 'package:flutter/material.dart';

class SystemTray extends StatelessWidget {
  const SystemTray({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NetworkWidget(),
            BluetoothWidget(),
            BrightnessWidget(),
          ],
        ));
  }
}
