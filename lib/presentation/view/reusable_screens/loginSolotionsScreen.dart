import 'package:flutter/material.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';

import '../managers/colorsManager.dart';
import '../managers/textStyleManager.dart';
import '../pages/login-page.dart';

class LoginSolutionScreen extends StatelessWidget {
  const LoginSolutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mainBackgroundIntro.png'),
            ),
          ),
          child: Stack(
            alignment:AlignmentDirectional.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(top:25.0,left: 10),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(icon: Icon(Icons.close_rounded),onPressed: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const MainPage()));},),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height *0.35,
                child:SizedBox(
                  height: 300,

                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const Text(
                        'Create account or log in ',
                        style: TextStyling.titleStyleText,
                      ),
                      Text(
                        'or continue with',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 30,),

                      Card(
                        color: const Color.fromRGBO(236, 239, 252, 1.0),
                        child: InkWell(
                          splashColor: const Color.fromRGBO(137, 154, 229, 0.6588235294117647),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          },
                          child: Row(
                            children: const [
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.email_outlined,color: ColorManager.lightBlueTextColor,)
                              ),
                              Expanded(
                                  child: Text(
                                    'Email',
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                ,
              )

            ],
          ),
        ),
      ),
    );
  }
}
