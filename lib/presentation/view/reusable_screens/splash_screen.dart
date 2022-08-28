import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    return const
       Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 140),
        child: SizedBox(
          width: 70,
          height: 70,
          child: Card(
            elevation: 0,
            child: Center(child: Image(image: AssetImage('assets/icons/Dermatology.png' ),fit: BoxFit.fill,),),
          ),
        ),

      );
  }
}
