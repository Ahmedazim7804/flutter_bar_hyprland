import 'package:bar/widgets/control_panel/widgets/sliders/slider.dart';
import 'package:flutter/material.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliderWidget(
      icon: Icons.bluetooth_audio,
    );
  }
}
