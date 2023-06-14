import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_course/widgets/video_player/youtube_jump_button.dart';
import 'package:open_course/widgets/video_player/youtube_play_pause_button.dart';
import 'package:open_course/widgets/video_player/youtube_video_position_seeker.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        pointerEvents: PointerEvents.none,
        showControls: false,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener((value) => {});

    _controller.cueVideoByUrl(
        mediaContentUrl: 'https://www.youtube.com/v/1xipg02Wu8s');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayerScaffold(
          autoFullScreen: false,
          enableFullScreenOnVerticalDrag: false,
          controller: _controller,
          builder: (context, player) {
            return Column(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2),
                    child: Stack(
                      children: [
                        PointerInterceptor(
                          child:
                              AspectRatio(aspectRatio: 16 / 9, child: player),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubeJumpButton(
              controller: _controller,
              jumpForward: false,
            ),
            SizedBox(
              width: 10,
            ),
            YoutubePlayPauseButton(controller: _controller),
            SizedBox(
              width: 10,
            ),
            YoutubeJumpButton(controller: _controller),
          ],
        ),
        YoutubeVideoPositionSeeker(controller: _controller),
      ],
    );
  }
}
