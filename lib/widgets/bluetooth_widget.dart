import 'package:bar/bloc/cubit/bluetooth_cubit.dart';
import 'package:bar/provider/config_provider.dart';
import 'package:bar/provider/shell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:process_run/process_run.dart';
import 'package:provider/provider.dart';

class BluetoothWidget extends StatelessWidget {
  const BluetoothWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Shell shell =
        Provider.of<ShellProvider>(context, listen: false).shell;
    final String command =
        Provider.of<ConfigProvider>(context).bluetoothDoubleClick;
    return Listener(
      child: GestureDetector(
        onDoubleTap: () {
          if (command.isNotEmpty) {
            shell.run(command);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade900,
          ),
          child: BlocBuilder<BluetoothCubit, BluetoothState>(
              builder: (context, state) {
            if (state is BluetoothDisabled) {
              return const BluetoothDisabledIcon();
            } else if (state is BluetoothConnected) {
              return BluetoothConnectedWiget(
                name: state.name,
              );
            } else if (state is BluetoothConnecting) {
              return const BluetoothLoadingAnimation();
            } else if (state is BluetoothDisconnected) {
              return const BluetoothDisconnectedIcon();
            } else {
              return const BluetoothDisabledIcon();
            }
          }),
        ),
      ),
    );
  }
}

class BluetoothConnectedWiget extends StatefulWidget {
  const BluetoothConnectedWiget({super.key, required this.name});

  final String name;

  @override
  State<BluetoothConnectedWiget> createState() =>
      _BluetoothConnectedWigetState();
}

class _BluetoothConnectedWigetState extends State<BluetoothConnectedWiget>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
      duration: const Duration(milliseconds: 200),
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
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/bluetooth_connected.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            AnimatedBuilder(
              animation: expandController,
              builder: (BuildContext context, Widget? child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: animation.value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }
}

class BluetoothLoadingAnimation extends StatelessWidget {
  const BluetoothLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(color: Colors.white, size: 24);
  }
}

class BluetoothDisconnectedIcon extends StatelessWidget {
  const BluetoothDisconnectedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/bluetooth_disconnected.svg',
        width: 24, height: 24, color: Colors.white);
  }
}

class BluetoothDisabledIcon extends StatelessWidget {
  const BluetoothDisabledIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/bluetooth_disabled.svg',
        width: 24, height: 24, color: Colors.white);
  }
}
