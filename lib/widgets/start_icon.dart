import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class StartIcon extends StatelessWidget {
  const StartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Start Menu'),
              content: const Text('This is the start menu'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child:
              SvgPicture.asset('assets/startIcon.svg', width: 30, height: 30)),
    );
  }
}
