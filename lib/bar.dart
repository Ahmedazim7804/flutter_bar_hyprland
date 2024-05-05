import 'package:bar/widgets/startIcon.dart';
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
    return const Scaffold(
        backgroundColor: Color(0xFF1A120E),
        body: SizedBox(
          height: 40,
          child: Row(
            children: [StartIcon(), Workspace()],
          ),
        ));
  }
}
