import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroSplashScreen extends StatefulWidget {
  const IntroSplashScreen({Key? key}) : super(key: key);

  @override
  State<IntroSplashScreen> createState() => _IntroSplashScreenState();
}

class _IntroSplashScreenState extends State<IntroSplashScreen> {
  late final VideoPlayerController _controller ;
  @override
  void initState() {

    _controller = VideoPlayerController.asset("assets/introAnimation.mp4")..addListener(() {
        setState(() {});
    })..setLooping(true)..initialize().then((value) => _controller.play());
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          :const Image(image: AssetImage('assets/mainBackgroundIntro.png'),
    ));
  }
}
