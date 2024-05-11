import 'package:bar/bloc/cubit/controlpanel_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlPanelCubit, ControlPanelState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade900,
          ),
          alignment: Alignment.center,
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<ControlPanelCubit>().toggle();
              },
              icon: const Icon(Icons.settings, color: Colors.white)),
        );
      },
    );
  }
}
