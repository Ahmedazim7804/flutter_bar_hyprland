import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class StartIcon extends StatelessWidget {
  const StartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30, child: SvgPicture.asset('assets/startIcon.svg'));
  }
}
