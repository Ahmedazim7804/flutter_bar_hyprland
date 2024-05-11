import 'dart:math';

import 'package:bar/bloc/cubit/bluetooth_cubit.dart';
import 'package:bar/widgets/control_panel/widgets/tiles/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbols.dart';

class BluetoothTile extends StatelessWidget {
  const BluetoothTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothCubit, BluetoothState>(
      builder: (context, state) {
        late final bool enabled;
        late final String title;
        late final String subtitle;
        late final IconData icon;

        if (state is BluetoothConnected) {
          enabled = true;
          title = state.name;
          subtitle = "Connected";
          icon = Icons.bluetooth;
        } else if (state is BluetoothConnecting) {
          enabled = true;
          title = "Bluetooth";
          subtitle = "Connected";
          icon = Icons.bluetooth_searching;
        } else {
          enabled = false;
          title = "Bluetooth";
          subtitle = "Disconnected";
          icon = Icons.bluetooth;
        }

        return Expanded(
            child: TileWidget(
          enabled: enabled,
          title: title,
          subtitle: subtitle,
          icon: icon,
        ));
      },
    );
  }
}
