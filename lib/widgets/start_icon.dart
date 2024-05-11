import 'package:bar/provider/config_provider.dart';
import 'package:bar/provider/shell_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:process_run/process_run.dart';
import 'package:provider/provider.dart';

class StartIcon extends StatelessWidget {
  const StartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final Shell shell =
        Provider.of<ShellProvider>(context, listen: false).shell;
    final String command = Provider.of<ConfigProvider>(context).startIconClick;
    return GestureDetector(
      onTap: () {
        if (command.isNotEmpty) {
          shell.run(command);
        }
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child:
              SvgPicture.asset('assets/startIcon.svg', width: 30, height: 30)),
    );
  }
}
