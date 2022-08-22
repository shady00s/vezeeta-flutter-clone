import 'package:flutter/material.dart';

import '../managers/colorsManager.dart';
import '../managers/textStyleManager.dart';
import '../pages/login-page.dart';

class LoginSolutionScreen extends StatelessWidget {
  const LoginSolutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
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
                child: IconButton(icon: Icon(Icons.close_rounded),onPressed: (){Navigator.pop(context);},),
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
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/fblogo.png'),
                                width: 33,
                              ),
                            ),
                            Expanded(
                                child: Text(
                                  'Facebook',
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: const Color.fromRGBO(236, 239, 252, 1.0),
                      child: InkWell(
                        splashColor: const Color.fromRGBO(137, 154, 229, 0.6588235294117647),
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/googlelogo.png'),
                                width: 30,
                              ),
                            ),
                            Expanded(
                                child: Text(
                                  'Google',
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                      ),
                    ),
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
    );
  }
}
