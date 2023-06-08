import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String vidoeUrl;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.vidoeUrl, 
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset( widget.vidoeUrl )
      ..setVolume(0)
      ..setLooping(true)
      // always play
      ..play();
  }

  // clean
  @override
  void dispose() {
    // Avoid that video keep playing when we not watching
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: controller.initialize(),
      builder: ( context, snapshot) {

        if ( snapshot.connectionState != ConnectionState.done ) {
          return const Center( child: CircularProgressIndicator( strokeWidth: 2 ));
        }

        // gestsueDectector detect a lot of gestures
        return GestureDetector(
          onTap: () {
            if ( controller.value.isPlaying ) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer( controller ),
        
                // Gradient
                VideoBackground(
                  stops: const[0.8, 1.0],
                ),
        
                // Text
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption( caption: widget.caption )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: titleStyle ),
    );
  }
}