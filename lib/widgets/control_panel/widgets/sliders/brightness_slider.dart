import 'package:bar/widgets/control_panel/widgets/sliders/slider.dart';
import 'package:flutter/material.dart';

class BrightnessSlider extends StatelessWidget {
  const BrightnessSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliderWidget(
      icon: Icons.brightness_6_rounded,
    );
  }
}
