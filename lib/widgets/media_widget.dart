import 'package:bar/bloc/cubit/media_cubit.dart';
import 'package:bar/streams/media_stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_marquee/text_marquee.dart';

class MediaWidget extends StatefulWidget {
  const MediaWidget({super.key});

  @override
  State<MediaWidget> createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        if (state is MediaStatePlaying) {
          return MediaStatePlayingContentWidget(
            mediaStatus: state.mediaStatus,
          );
        } else if (state is MediaStatePaused) {
          return MediaStatePausedContentWidget(
            mediaStatus: state.mediaStatus,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class MediaStatePlayingContentWidget extends StatelessWidget {
  const MediaStatePlayingContentWidget({super.key, required this.mediaStatus});
  final MediaStatus mediaStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 250,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset('assets/media_background.png').image,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const InkWell(
            child: Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.pause_outlined,
            size: 24,
            color: Colors.white,
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 24,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.music_note, color: Colors.white),
          Expanded(
            child: TextMarquee(
              "${mediaStatus.artist} - ${mediaStatus.title}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              duration: const Duration(seconds: 3),
              delay: const Duration(seconds: 0),
              spaceSize: 20.0,
              curve: Curves.linear,
            ),
          )
        ],
      ),
      // SizedBox(
      //   width: 200,
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(20),
      //     child:
      //         Image.asset('assets/media_background.png', fit: BoxFit.cover),
      //   ),
      // ),
    );
  }
}

class MediaStatePausedContentWidget extends StatelessWidget {
  const MediaStatePausedContentWidget({super.key, required this.mediaStatus});
  final MediaStatus mediaStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 250,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset('assets/media_background.png').image,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const InkWell(
            child: Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.play_arrow_outlined,
            size: 24,
            color: Colors.white,
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 24,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text("${mediaStatus.artist} - ${mediaStatus.title}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          )
        ],
      ),
      // SizedBox(
      //   width: 200,
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(20),
      //     child:
      //         Image.asset('assets/media_background.png', fit: BoxFit.cover),
      //   ),
      // ),
    );
  }
}
