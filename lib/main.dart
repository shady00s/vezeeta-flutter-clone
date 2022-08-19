import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vezeeta_clone/businuss-logic/cubit/cubit.dart';
import 'package:vezeeta_clone/businuss-logic/cubit/cubit_state.dart';
import 'package:vezeeta_clone/presentation/view/managers/colorsManager.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/introSplashScreen.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/noConnectivityScreen.dart';


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
        backgroundColor: ColorManager.scaffoldBackGroundColor,
        scaffoldBackgroundColor: ColorManager.scaffoldBackGroundColor,
        appBarTheme: const AppBarTheme(
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
  void initState() {
    demoIntroSplashScreen();

    super.initState();
  }
  @override

  bool isLoading = true;
  demoIntroSplashScreen(){
    Future.delayed(const Duration(seconds: 5  ) ).then((value) => setState((){
      isLoading = false;
    }));
  }
  Widget build(BuildContext context) {

   
    return isLoading  ?   IntroSplashScreen(): MainPage();
      

    //   BlocProvider<CubitFunction>(create: (context)=> CubitFunction().networkHandeler(),child:   isLoading?  const IntroSplashScreen():   BlocBuilder<CubitFunction,CubitState>(
    //
    //     builder: (context,state){
    //       if(CubitFunction().networkHandeler() == true){
    //         return   MainPage();
    //       }else {
    //         return const NoConnectivityScreen();
    //       }
    //
    //     }
    // ) );


  }
}
