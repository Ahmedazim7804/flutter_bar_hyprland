import 'package:bar/widgets/media_widget.dart';
import 'package:bar/widgets/power_widget.dart';
import 'package:bar/widgets/start_icon.dart';
import 'package:bar/widgets/systray_widget.dart';
import 'package:bar/widgets/workspace.dart';
import 'package:flutter/material.dart';

class MyBar extends StatefulWidget {
  const MyBar({super.key});

  @override
  State<MyBar> createState() => _MyBarState();
}

class _MyBarState extends State<MyBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1A120E),
        body: Container(
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StartIcon(),
              Workspace(),
              MediaWidget(),
              Spacer(),
              SystemTray(),
              PowerWidget(),
              SizedBox(
                width: 50,
              )
            ],
          ),
        ));
  }
}
