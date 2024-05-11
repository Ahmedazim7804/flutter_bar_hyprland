import 'package:bar/bloc/cubit/network_cubit.dart';
import 'package:bar/models/network_model.dart';
import 'package:bar/provider/config_provider.dart';
import 'package:bar/provider/shell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:process_run/process_run.dart';

import 'package:provider/provider.dart';

class NetworkWidget extends StatelessWidget {
  const NetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Shell shell =
        Provider.of<ShellProvider>(context, listen: false).shell;
    final String command = Provider.of<ConfigProvider>(context).wifiDoubleClick;
    return GestureDetector(
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
        child:
            BlocBuilder<NetworkCubit, NetworkState>(builder: (context, state) {
          if (state is NetworkDisabled) {
            return const NetworkDisabledIcon();
          } else if (state is NetworkEthernetConnected) {
            return const EthernetIcon();
          } else if (state is NetworkConnecting ||
              state is NetworkDisconnecting) {
            return const WifiLoadingAnimation();
          } else if (state is NetworkWifiConnected) {
            return WifiConnectedWidget(
              wifiInfo: state.networkInfo,
            );
          } else if (state is NetworkDisconnected) {
            return const WifiDisconnectedIcon();
          } else {
            return const NetworkDisabledIcon();
          }
        }),
      ),
    );
  }
}

class WifiConnectedWidget extends StatefulWidget {
  const WifiConnectedWidget({super.key, required this.wifiInfo});

  final NetworkInfo wifiInfo;

  @override
  State<WifiConnectedWidget> createState() => _WifiConnectedWidgetState();
}

class _WifiConnectedWidgetState extends State<WifiConnectedWidget>
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
              'assets/wifi_full.svg',
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
                        widget.wifiInfo.wifiSsid!,
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

class EthernetIcon extends StatelessWidget {
  const EthernetIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/ethernet.svg',
      color: Colors.white,
      width: 24,
      height: 24,
    );
  }
}

class NetworkDisabledIcon extends StatelessWidget {
  const NetworkDisabledIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/wifi_off.svg',
      color: Colors.white,
      width: 24,
      height: 24,
    );
  }
}

class WifiLoadingAnimation extends StatelessWidget {
  const WifiLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(color: Colors.white, size: 24);
  }
}

class WifiDisconnectedIcon extends StatelessWidget {
  const WifiDisconnectedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/wifi_disconnected.svg',
      color: Colors.white,
      width: 24,
      height: 24,
    );
  }
}
