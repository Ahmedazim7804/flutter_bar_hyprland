import 'package:bar/provider/config_provider.dart';
import 'package:bar/widgets/datetime_widget.dart';
import 'package:bar/widgets/media_widget.dart';
import 'package:bar/widgets/power_widget.dart';
import 'package:bar/widgets/start_icon.dart';
import 'package:bar/widgets/systray_widget.dart';
import 'package:bar/widgets/workspace.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color =
        Color(int.parse(Provider.of<ConfigProvider>(context).backgroundColor));
    return Scaffold(
      body: Container(
        color: color,
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
