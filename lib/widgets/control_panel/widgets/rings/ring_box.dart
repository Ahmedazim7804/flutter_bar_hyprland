import 'package:bar/widgets/control_panel/widgets/rings/cpu_ring.dart';
import 'package:bar/widgets/control_panel/widgets/rings/ram_ring.dart';
import 'package:flutter/material.dart';

class RingBox extends StatelessWidget {
  const RingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(20)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          CpuRingWidget(),
          RamRingWidget(),
        ],
      ),
    );
  }
}
