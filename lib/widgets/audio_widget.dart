import 'package:bar/streams/audio_stream.dart';
import 'package:flutter/material.dart';

class AudioWidget extends StatelessWidget {
  const AudioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AudioStream();
    return Container(
      color: Colors.grey,
      child: const Text("Audio"),
    );
  }
}
