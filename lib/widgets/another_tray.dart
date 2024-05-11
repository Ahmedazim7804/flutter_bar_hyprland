import 'package:bar/widgets/settings_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnotherTray extends StatelessWidget {
  const AnotherTray({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [SettingsWidget()],
      ),
    );
  }
}
