import 'package:dreamcil/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<Videos> {
  final List<YoutubePlayerController> _controllers = [
    '6qeEQdRND_Q',
    'EGlTfQvHN-0',
    'TH4Q66sK_dI',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '      Videos',
              style: TextStyle(
                color: Colors.green,
                letterSpacing: .8,
                fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: AppTheme.nearlyWhite,
          body: ListView.separated(
            itemBuilder: (context, index) {
              return YoutubePlayer(
                key: ObjectKey(_controllers[index]),
                controller: _controllers[index],
                actionsPadding: const EdgeInsets.only(left: 16.0),
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: 10.0),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              );
            },
            itemCount: _controllers.length,
            separatorBuilder: (context, _) => const SizedBox(height: 10.0),
          ),
        ),
      ),
    );
  }
}
