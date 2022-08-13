import 'package:flutter/cupertino.dart';

class IntroSplashScreen extends StatefulWidget {
  const IntroSplashScreen({Key? key}) : super(key: key);

  @override
  State<IntroSplashScreen> createState() => _IntroSplashScreenState();
}

class _IntroSplashScreenState extends State<IntroSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/mainloginbackground.jpg'))
      ),
    );
  }
}
