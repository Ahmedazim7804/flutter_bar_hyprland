import 'dart:convert';

import 'package:bar/bloc/cubit/battery_cubit.dart';
import 'package:bar/bloc/cubit/bluetooth_cubit.dart';
import 'package:bar/bloc/cubit/media_cubit.dart';
import 'package:bar/bloc/cubit/network_cubit.dart';
import 'package:bar/bloc/cubit/workspace_cubit.dart';
import 'package:bar/provider/config_provider.dart';
import 'package:bar/provider/shell_provider.dart';
import 'package:flutter/material.dart';
import 'package:bar/bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wayland_layer_shell/types.dart';
import 'package:wayland_layer_shell/wayland_layer_shell.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String? home = Platform.environment['HOME'];

  final File file = File('$home/.config/mybar/config.json');
  late final Map<String, dynamic> config;

  if (file.existsSync()) {
    config = jsonDecode(file.readAsStringSync());
  } else {
    config = {};
  }

  late final String wifiDoubleClick;
  late final String bluetoothDoubleClick;
  late final String startIconClick;
  late final String backgroundColor;

  try {
    wifiDoubleClick = config['wifi']['double_click'];
  } catch (e) {
    wifiDoubleClick = "";
  }

  try {
    bluetoothDoubleClick = config['bluetooth']['double_click'];
  } catch (e) {
    bluetoothDoubleClick = "";
  }

  try {
    startIconClick = config['start']['click'];
  } catch (e) {
    startIconClick = "";
  }

  try {
    backgroundColor = config['background_color'];
  } catch (e) {
    backgroundColor = "";
  }

  final waylandLayerShellPlugin = WaylandLayerShell();
  int barHeight = 40;
  await waylandLayerShellPlugin.initialize(1920, barHeight);
  await waylandLayerShellPlugin.setAnchor(ShellEdge.edgeTop, true);
  await waylandLayerShellPlugin.setLayer(ShellLayer.layerTop);
  await waylandLayerShellPlugin.setExclusiveZone(barHeight);

  // await waylandLayerShellPlugin
  //     .setKeyboardMode(ShellKeyboardMode.keyboardModeExclusive);
  // FlutterLayerShell.configure(edge: LayerShellEdge.TOP, size: 40);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BatteryCubit()),
          BlocProvider(create: (context) => BluetoothCubit()),
          BlocProvider(create: (context) => MediaCubit()),
          BlocProvider(create: (context) => NetworkCubit()),
          BlocProvider(create: (context) => WorkspaceCubit()),
        ],
        child: MultiProvider(providers: [
          Provider.value(
              value: ConfigProvider(
            wifiDoubleClick: wifiDoubleClick,
            bluetoothDoubleClick: bluetoothDoubleClick,
            startIconClick: startIconClick,
            backgroundColorHex: backgroundColor,
          )),
          Provider.value(value: ShellProvider())
        ], child: const MyBar())),
  ));
}
