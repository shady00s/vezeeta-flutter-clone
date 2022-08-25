import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/data/controller/userController.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/loginSolotionsScreen.dart';

import '../../managers/colorsManager.dart';
import '../../reuseable_widgets/userAppointmentCard.dart';
import '../login-page.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}
getToken()  async{

  SharedPreferences prefs =await  SharedPreferences.getInstance();


  return prefs.getString('user-token') ??'';
}


class _ActivitiesPageState extends State<ActivitiesPage> {


@override
  void initState() {
    getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    dynamic Auth =   getToken() ;

    return Auth !=''? Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(

        children: [
          Text("My Activity",style: TextStyling.titleStyleText,),
            StreamBuilder<dynamic>(
                stream:  UserController().showUserAppointments(),
                builder: (context,snapshot){

              switch(snapshot.connectionState){
                case ConnectionState.none:

                case ConnectionState.waiting:
                 return Expanded(child: Center(child: CircularProgressIndicator(),));
                case ConnectionState.active:

                case ConnectionState.done:
                  if(snapshot.hasData){
                    UserBody? data = snapshot.data['userData'];
                    List? doctorData =  snapshot.data['doctorData'];
                    return Expanded(
                      child: ListView.separated(separatorBuilder:(context,index)=> Divider(), itemCount: data!.userAppointments!.length,  itemBuilder: (context,index){
                        return   UserAppointmentCardWidget(data: data.userAppointments![index], doctorData: doctorData![index],);
                      }, ),
                    );
                  }
                else{

                  return Expanded(child: const Center(child: Text('No Activites'),));
                  }

              }
            })

        ],
      ),
    ) : Container(
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
              child: IconButton(icon: Icon(Icons.close_rounded),onPressed: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainPage()));},),
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
    );
  }
}
