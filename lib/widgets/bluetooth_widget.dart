import 'package:bar/bloc/cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BluetoothWidget extends StatelessWidget {
  const BluetoothWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothCubit, BluetoothState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
