import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key, required this.icon});

  final IconData icon;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          widget.icon,
          color: Colors.white,
        ),
        title: Slider(
          activeColor: const Color(0xFF7BA5DD),
          value: sliderValue,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
            });
          },
        ));
  }
}
