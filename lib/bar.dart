import 'package:bar/widgets/another_tray.dart';
import 'package:bar/widgets/control_panel/widgets/control_panel.dart';
import 'package:bar/widgets/datetime_widget.dart';
import 'package:bar/widgets/media_widget.dart';
import 'package:bar/widgets/power_widget.dart';
import 'package:bar/widgets/start_icon.dart';
import 'package:bar/widgets/systray_widget.dart';
import 'package:bar/widgets/workspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wayland_layer_shell/types.dart';
import 'package:wayland_layer_shell/wayland_layer_shell.dart';

class MyBar extends StatefulWidget {
  const MyBar({super.key});

  @override
  State<MyBar> createState() => _MyBarState();
}

class _MyBarState extends State<MyBar> {
  final bool _show = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color(0xFF080C0D),
        backgroundColor: Colors.transparent,
        // backgroundColor: const Color(0xFF1A120E),
        body: Column(
          children: [
            Container(
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
                  AnotherTray(),
                  PowerWidget(),
                  DateTimeWidget(),
                ],
              ),
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                ControlPanelWidget(),
              ],
            ),
          ],
        ));
  }
}
