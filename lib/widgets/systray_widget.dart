import 'package:bar/streams/network_stream.dart';
import 'package:bar/widgets/network_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SystemTray extends StatelessWidget {
  const SystemTray({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkStream();
    return Container(
        alignment: Alignment.center,
        child: const Row(
          children: [
            NetworkWidget(),
          ],
        ));
  }
}
