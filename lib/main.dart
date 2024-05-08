import 'package:bar/bloc/cubit/battery_cubit.dart';
import 'package:bar/bloc/cubit/bluetooth_cubit.dart';
import 'package:bar/bloc/cubit/media_cubit.dart';
import 'package:bar/bloc/cubit/network_cubit.dart';
import 'package:bar/bloc/cubit/workspace_cubit.dart';
import 'package:bar/streams/hyprland_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layer_shell/flutter_layer_shell.dart';
import 'package:bar/bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterLayerShell.configure(edge: LayerShellEdge.TOP, size: 40);
  runApp(MaterialApp(
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
