import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.enabled,
      required this.icon});
  final String title;
  final String subtitle;
  final bool enabled;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: enabled ? const Color(0xFF7BA5DD) : const Color(0xFF080C0D)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 12, height: 1, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 28,
                  color: Colors.white,
                )),
          ],
        ));
  }
}
