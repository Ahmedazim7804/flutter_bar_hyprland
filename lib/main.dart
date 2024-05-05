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
    home: BlocProvider<WorkspaceCubit>(
      create: (context) => WorkspaceCubit(),
      child: const MyBar(),
    ),
  ));
}
