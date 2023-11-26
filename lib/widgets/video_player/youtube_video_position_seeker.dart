import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoPositionSeeker extends StatelessWidget {
  const YoutubeVideoPositionSeeker({super.key, required this.controller});

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    double value = 0.0;

    return StreamBuilder<YoutubeVideoState>(
      stream: controller.videoStateStream,
      initialData: const YoutubeVideoState(),
      builder: (context, snapshot) {
        int position = snapshot.data?.position.inSeconds ?? 0;
        int positionMins = snapshot.data?.position.inMinutes ?? 0;
        int duration = controller.metadata.duration.inSeconds;
        int durationMins = controller.metadata.duration.inMinutes;
        int durationSecs = controller.metadata.duration.inSeconds % 60;

        value = position == 0 || duration == 0 ? 0 : position / duration;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Text(
                    "${positionMins.toString().padLeft(1, '0')}:${(position % 60).toString().padLeft(2, '0')}",
                    style: GoogleFonts.azeretMono(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(166, 255, 255, 255),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      label: "Time",
                      activeColor: const Color(0xff49C29D),
                      inactiveColor: const Color.fromRGBO(255, 255, 255, 0.2),
                      value: value,
                      onChanged: (positionFraction) {
                        value = positionFraction;
                        setState(() {});
                        controller.seekTo(
                          seconds: (value * duration).toDouble(),
                          allowSeekAhead: true,
                        );
                      },
                      min: 0,
                      max: 1,
                    ),
                  ),
                  Text(
                    "${durationMins.toString().padLeft(1, '0')}:${durationSecs.toString().padLeft(2, '0')}",
                    style: GoogleFonts.azeretMono(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(166, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
