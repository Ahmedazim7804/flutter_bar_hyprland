import 'package:bar/widgets/control_panel/widgets/tiles/wifi_tile.dart';
import 'package:flutter/material.dart';

class TilesWidget extends StatelessWidget {
  const TilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            Row(
              children: [WifiTile()],
            )
          ],
        ));
  }
}
