import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeFullscreenButton extends StatelessWidget {
  const YoutubeFullscreenButton({
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
            color: const Color(0xffFF0000),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.fullscreen,
              color: Color(0xffffffff),
            ),
            onPressed: () => {controller.toggleFullScreen()},
          ),
        );
      },
    );
  }
}
