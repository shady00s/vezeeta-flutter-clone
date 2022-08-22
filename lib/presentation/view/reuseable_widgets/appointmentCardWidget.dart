import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/data/model/doctorModel.dart';
import 'package:vezeeta_clone/presentation/view/pages/doctorAppointmentRegistration.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/loginSolotionsScreen.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/doctorDetailsCardWidget.dart';

import '../managers/colorsManager.dart';
import '../managers/textStyleManager.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({Key? key ,required this.doctorData,required this.doctorInfoTest}) : super(key: key);
  final DoctorInfoTest doctorInfoTest;
  final Body doctorData;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // right button
          SizedBox(
            width: 30,
            height: 30,
            child:      DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(3),
                  border:  Border.all(color:  const Color.fromRGBO(186, 189, 189, 0.5058823529411764))
              ),
              child:        Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: IconButton( onPressed: (){}, icon: const Icon(Icons.arrow_back_ios,size: 15,color: ColorManager.lightBlueTextColor,) ,padding: EdgeInsets.zero, )) ,
            )
          ),
           AppointmentElement(time:  doctorInfoTest.availableAppointment[0].hour, day: doctorInfoTest.availableAppointment[0].day, doctorData: doctorData, address:doctorInfoTest.address,),
           AppointmentElement(time:  doctorInfoTest.availableAppointment[1].hour, day: doctorInfoTest.availableAppointment[1].day, doctorData: doctorData,  address:doctorInfoTest.address,),
           AppointmentElement(time:  doctorInfoTest.availableAppointment[2].hour, day: doctorInfoTest.availableAppointment[2].day, doctorData: doctorData,  address:doctorInfoTest.address,),
          // left button
          SizedBox(
              width: 30,
              height: 30,
              child:      DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(3),
                    border:  Border.all(color:  const Color.fromRGBO(186, 189, 189, 0.5058823529411764))
                ),
                child:        Padding(
                    padding: const EdgeInsets.only(left:4.0),
                    child: IconButton( onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,size: 15,color: ColorManager.lightBlueTextColor,) ,padding: EdgeInsets.zero, )) ,
              )
          )
          ]),
    );
  }
}

class AppointmentElement extends StatelessWidget {
  const AppointmentElement({Key? key, required this.address, required this.time ,required this.day  ,required this.doctorData}) : super(key: key);
    final String time;
    final String day;
    final String address;
    final Body doctorData;
  @override
  Widget build(BuildContext context) {

    List<String> time2 = time.split('');

   int editedTime = int.parse(time2[1]) +3 ;
     time2[1] = editedTime.toString();


     getToken() async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String  token =  prefs.getString('user-token') ?? '';

       return token;
     }

    return SizedBox(
      height:  130,
      width:  MediaQuery.of(context).size.width / 4.55,
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)
        , border:  Border.all(color: const Color.fromRGBO(186, 189, 189, 0.5058823529411764) )
        ),

        child: InkWell(
          onTap: () {
            getToken().then((value) {
                if(value != ''){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  DoctorAppointmentRegistrationScreen (doctorData: doctorData, selectedAppointments: {'day':day,'time':time,'address':address},)));
            }
            else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginSolutionScreen()));
            }

            }
            );


          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              // first bar
              
               Expanded(
                flex: 1,
                child : DecoratedBox(decoration:const BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(9) ,topRight: Radius.circular(9)),color: Color.fromRGBO(
                    29, 72, 211, 1.0))
                ,child:  Center(child: Text(day ,textAlign: TextAlign.center,style :const TextStyle(color: Colors.white),)),
                ),
              ),
              Expanded(flex: 3, child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(time ,style: TextStyling.subTitleStyleText,),
                const Text("To",style: TextStyling.subTitleStyleText,),
                Text(time2.join(''),style: TextStyling.subTitleStyleText,),
              ],)),

              const Expanded(
                flex: 1,
                child: DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(9) ,bottomLeft: Radius.circular(9)),color: Color.fromRGBO(
                    232, 29, 29, 1.0))

                  ,child:  Center(child: Text("Book",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
                ),
              ),
            ]
            ,
          ),
        ),
      ),
    );
  }
}

