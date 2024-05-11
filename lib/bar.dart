import 'package:bar/widgets/datetime_widget.dart';
import 'package:bar/widgets/media_widget.dart';
import 'package:bar/widgets/power_widget.dart';
import 'package:bar/widgets/start_icon.dart';
import 'package:bar/widgets/systray_widget.dart';
import 'package:bar/widgets/workspace.dart';
import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080C0D),
      body: Container(
        color: const Color(0xFF080C0D),
        height: 40,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StartIcon(),
            Workspace(),
            MediaWidget(),
            Spacer(),
            SystemTray(),
            PowerWidget(),
            DateTimeWidget(),
          ],
        ),
      ),
    );
  }
}
