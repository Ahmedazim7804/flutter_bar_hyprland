import 'package:bar/bloc/cubit/workspace_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Workspace extends StatefulWidget {
  const Workspace({super.key});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkspaceCubit, WorkspaceState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
              children:
                  List.generate(state.numberOfWorkspaces, (index) => index)
                      .map((e) => WorkspaceButton(
                            active: state.active == e + 1,
                            exists: state.exists.contains(e + 1),
                          ))
                      .toList()),
        );
      },
    );
  }
}

class WorkspaceButton extends StatelessWidget {
  const WorkspaceButton(
      {super.key, required this.active, required this.exists});

  final bool active;
  final bool exists;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: SvgPicture.asset(
          active
              ? 'assets/pacman.svg'
              : (exists ? 'assets/ghost.svg' : 'assets/dot.svg'),
          width: 20,
          height: 20,
          color: active ? Colors.yellow : Colors.white,
        ));
  }
}
