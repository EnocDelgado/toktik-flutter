import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
});

  @override
  Widget build(BuildContext context) {
    // Allow to scroll to fullscreen
    return PageView.builder(
      // scroll up and down
      scrollDirection: Axis.vertical,
      // BouncingScrollPhysic is to rebound between scroll
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder:  ( context, index ) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // vidoes player + gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                vidoeUrl: videoPost.videoUrl,
              ),
            ),

            // Buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost )
            ),
          ],
        );
      },
    );
  }
}

