import 'package:flutter/material.dart';
import 'package:vezeeta_clone/view/managers/colorsManager.dart';
import 'package:vezeeta_clone/view/pages/main-page/main-page.dart';
import 'package:vezeeta_clone/view/reusable_screens/introSplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        scaffoldBackgroundColor: ColorManager.scaffoldBackGroundColor,
        appBarTheme: AppBarTheme(
            backgroundColor: ColorManager.appBarColor,
          elevation: 0
        ),
        primarySwatch: Colors.blue,
      ),
      home:  Routing(),
    );
  }
}
class Routing extends StatefulWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  @override
  bool isLoading = true;
  demoIntroSplashScreen(){
    Future.delayed(const Duration(seconds: 3) ).then((value) => setState((){
      isLoading = false;
    }));
  }
  Widget build(BuildContext context) {
    demoIntroSplashScreen();
   
    return   isLoading?  const IntroSplashScreen():   MainPage();
  }
}
