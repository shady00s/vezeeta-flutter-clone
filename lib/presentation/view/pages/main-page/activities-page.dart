import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/data/controller/userController.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/loginSolotionsScreen.dart';

import '../../managers/colorsManager.dart';
import '../../reusable_screens/splash_screen.dart';
import '../../reuseable_widgets/userAppointmentCard.dart';
import '../login-page.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}
 Future<String> getToken()  async{

   SharedPreferences prefs =await SharedPreferences.getInstance();

    return prefs.getString('user-token') ??'';

}


class _ActivitiesPageState extends State<ActivitiesPage> {


@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    return SizedBox(
        height: MediaQuery.of(context).size.height-10,
        width: MediaQuery.of(context).size.width,
        child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<String>(
          future: getToken(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState){
              case ConnectionState.none:

              case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator(),);
              case ConnectionState.active:

              case ConnectionState.done:

                if(snapshot.hasData){
                  return Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("My Activity",style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w600),),
                      ),

                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text("Doctor Appointments" ,textAlign: TextAlign.start,style: TextStyle(fontSize: 16, color: Colors.grey,fontWeight: FontWeight.w300),),
                        ),
                      ),
                      FutureBuilder<dynamic>(
                          future:  UserController().showUserAppointments(),
                          builder: (context,snapshot){

                            switch(snapshot.connectionState){
                              case ConnectionState.none:

                              case ConnectionState.waiting:
                              WidgetsBinding.instance.addPostFrameCallback((_) async {
                                showDialog(context: context, builder: (context)=>const SplashScreen());
                              });
                              return const Text('') ;
                              case ConnectionState.active:

                              case ConnectionState.done:

                                if(snapshot.hasData && snapshot.data!.isNotEmpty){
                                  Navigator.pop(context);
                                  UserBody? data = snapshot.data['userData'];
                                  List? doctorData =  snapshot.data['doctorData'];
                                  return Expanded(
                                    child: ListView.separated(separatorBuilder:(context,index)=> const Divider(), itemCount: data!.userAppointments!.length,  itemBuilder: (context,index){
                                      return   UserAppointmentCardWidget(data: data.userAppointments![index], doctorData: doctorData![index],);
                                    }, ),
                                  );
                                }

                                else{
                                  return const Expanded(child:  Center(child: Text('No Activites')));
                                }

                            }
                          })

                    ],
                  );
                }
                else {
                  WidgetsBinding.instance.addPostFrameCallback((_){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginSolutionScreen()));

                  });
                  return const Center(child: Text('No Activites'));
                }
            }

          }
        ),
  ),
      );
  }
}
