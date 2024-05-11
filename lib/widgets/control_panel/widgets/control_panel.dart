import 'package:bar/bloc/cubit/controlpanel_cubit.dart';
import 'package:bar/widgets/control_panel/widgets/rings/ring_box.dart';
import 'package:bar/widgets/control_panel/widgets/sliders/slider_box.dart';
import 'package:bar/widgets/control_panel/widgets/tiles/bluetooth_tile.dart';
import 'package:bar/widgets/control_panel/widgets/tiles/wifi_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlPanelWidget extends StatefulWidget {
  const ControlPanelWidget({super.key});

  @override
  State<ControlPanelWidget> createState() => _ControlPanelWidgetState();
}

class _ControlPanelWidgetState extends State<ControlPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlPanelCubit, ControlPanelState>(
      builder: (context, state) {
        if (state is ControlPanelHide) {
          return const SizedBox.shrink();
        }

        return const ControlPanelWidgetContent();
      },
    );
  }
}

class ControlPanelWidgetContent extends StatefulWidget {
  const ControlPanelWidgetContent({super.key});

  @override
  State<ControlPanelWidgetContent> createState() =>
      _ControlPanelWidgetContentState();
}

class _ControlPanelWidgetContentState extends State<ControlPanelWidgetContent> {
  bool _entered = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (!_entered) {
        if (mounted) {
          context.read<ControlPanelCubit>().hide();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        print("ENTERED");
        _entered = true;
      },
      onExit: (event) {
        print("EXITED");
        context.read<ControlPanelCubit>().hide();
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          width: 400,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF080C0D)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [WifiTile(), BluetoothTile()],
              ),
              SliderBox(),
              RingBox(),
            ],
          )),
    );
  }
}
