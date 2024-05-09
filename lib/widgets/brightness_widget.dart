import 'package:bar/streams/brightness_stream.dart';
import 'package:flutter/material.dart';

class BrightnessWidget extends StatefulWidget {
  const BrightnessWidget({super.key});

  @override
  State<BrightnessWidget> createState() => _BrightnessWidgetState();
}

class _BrightnessWidgetState extends State<BrightnessWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expandController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 1).animate(expandController);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
          _isExpanded ? expandController.forward() : expandController.reverse();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade900,
        ),
        child: StreamBuilder<int>(
            stream: BrightnessStream().eventListener.stream,
            initialData: 0,
            builder: (context, snapshot) {
              late final IconData icon;

              if (snapshot.hasData) {
                if (snapshot.data! <= 5) {
                  icon = Icons.brightness_3_rounded;
                } else if (snapshot.data! <= 20) {
                  icon = Icons.brightness_3_rounded;
                } else if (snapshot.data! <= 35) {
                  icon = Icons.brightness_2_rounded;
                } else if (snapshot.data! <= 45) {
                  icon = Icons.brightness_4_rounded;
                } else if (snapshot.data! <= 55) {
                  icon = Icons.brightness_5_rounded;
                } else if (snapshot.data! <= 75) {
                  icon = Icons.brightness_5_rounded;
                } else if (snapshot.data! <= 90) {
                  icon = Icons.brightness_6_rounded;
                } else {
                  icon = Icons.brightness_high_rounded;
                }
              } else {
                icon = Icons.brightness_auto_rounded;
              }

              return Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                  AnimatedBuilder(
                    animation: expandController,
                    builder: (BuildContext context, Widget? child) {
                      return ClipRect(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            widthFactor: animation.value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "${snapshot.data}%",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      );
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
