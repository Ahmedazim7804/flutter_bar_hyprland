import 'package:bar/bloc/cubit/network_cubit.dart';
import 'package:bar/widgets/control_panel/widgets/tiles/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WifiTile extends StatelessWidget {
  const WifiTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkCubit, NetworkState>(
      builder: (context, state) {
        late final bool enabled;
        late final String title;
        late final String subtitle;
        late final IconData icon;

        if (state is NetworkWifiConnected) {
          enabled = true;
          title = state.networkInfo.wifiSsid!;
          subtitle = "Connected";
          icon = Icons.wifi;
        } else if (state is NetworkConnecting) {
          enabled = true;
          title = "Connecting";
          subtitle = "Connected";
          icon = Icons.wifi;
        } else if (state is NetworkEthernetConnected) {
          enabled = true;
          title = "Ethernet";
          subtitle = "Connected";
          icon = Icons.cable;
        } else {
          enabled = false;
          title = "Wi-Fi";
          subtitle = "Disconnected";
          icon = Icons.wifi;
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
