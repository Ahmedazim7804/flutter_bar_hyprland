import 'package:bar/widgets/control_panel/widgets/sliders/brightness_slider.dart';
import 'package:bar/widgets/control_panel/widgets/sliders/slider.dart';
import 'package:bar/widgets/control_panel/widgets/sliders/volume_slider.dart';
import 'package:flutter/material.dart';

class SliderBox extends StatelessWidget {
  const SliderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(20)),
      child: const Column(
        children: [BrightnessSlider(), VolumeSlider()],
      ),
    );
  }
}
