import 'package:bar/bloc/cubit/battery_cubit.dart';
import 'package:bar/bloc/cubit/bluetooth_cubit.dart';
import 'package:bar/bloc/cubit/media_cubit.dart';
import 'package:bar/bloc/cubit/network_cubit.dart';
import 'package:bar/bloc/cubit/workspace_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layer_shell/flutter_layer_shell.dart';
import 'package:bar/bar.dart';
import 'package:wayland_layer_shell/types.dart';
import 'package:wayland_layer_shell/wayland_layer_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final waylandLayerShellPlugin = WaylandLayerShell();
  int barHeight = 40;
  await waylandLayerShellPlugin.initialize(1920, barHeight);
  await waylandLayerShellPlugin.setAnchor(ShellEdge.edgeTop, true);
  waylandLayerShellPlugin.setLayer(ShellLayer.layerTop);
  await waylandLayerShellPlugin.setExclusiveZone(40);
  // waylandLayerShellPlugin.setExclusiveZone(barHeight);
  // await waylandLayerShellPlugin
  //     .setKeyboardMode(ShellKeyboardMode.keyboardModeExclusive);
  // FlutterLayerShell.configure(edge: LayerShellEdge.TOP, size: 40);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WorkspaceCubit()),
        BlocProvider(create: (context) => MediaCubit()),
        BlocProvider(
          create: (context) => BatteryCubit(),
        ),
        BlocProvider(create: (context) => NetworkCubit()),
        BlocProvider(create: (context) => BluetoothCubit())
      ],
      child: const MyBar(),
    ),
  ));
}
