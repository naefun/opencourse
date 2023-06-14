import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayPauseButton extends StatelessWidget {
  const YoutubePlayPauseButton({
    super.key,
    required this.controller,
  });

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return YoutubeValueBuilder(
      controller: controller,
      builder: (context, value) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff111111),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: Icon(
              value.playerState == PlayerState.playing
                  ? Icons.pause
                  : Icons.play_arrow,
              color: const Color(0xffffffff),
            ),
            onPressed: () {
              value.playerState == PlayerState.playing
                  ? controller.pauseVideo()
                  : controller.playVideo();
            },
          ),
        );
      },
    );
  }
}
