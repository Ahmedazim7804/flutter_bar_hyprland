import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class StartIcon extends StatelessWidget {
  const StartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SvgPicture.asset('assets/startIcon.svg', width: 30, height: 30));
  }
}
