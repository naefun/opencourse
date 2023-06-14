import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeJumpButton extends StatelessWidget {
  YoutubeJumpButton({
    super.key,
    required this.controller,
    this.jumpForward = true,
  });

  final YoutubePlayerController controller;
  bool jumpForward;

  @override
  Widget build(BuildContext context) {
    return YoutubeValueBuilder(
      controller: controller,
      builder: (context, value) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xff111111),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: Icon(
              buttonIcon(),
              color: Color(0xffffffff),
            ),
            onPressed: () {
              buttonAction(value);
            },
          ),
        );
      },
    );
  }

  IconData buttonIcon() {
    if (jumpForward) {
      return Icons.fast_forward_outlined;
    } else {
      return Icons.fast_rewind_outlined;
    }
  }

  void buttonAction(YoutubePlayerValue value) async {
    if (value.playerState != PlayerState.playing) {
      return;
    }
    double jumpAmount = jumpForward ? 10 : -10;

    double currentTime = await controller.currentTime;
    await controller.seekTo(
        seconds: currentTime + jumpAmount, allowSeekAhead: true);
  }
}
