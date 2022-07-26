import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/data/controller/userController.dart';
import 'package:vezeeta_clone/data/model/doctorModel.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';
import 'package:vezeeta_clone/presentation/view/managers/colorsManager.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/activities-page.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/subPages/doctorProfilePage.dart';

import 'doctorInfoAppointmentPopup.dart';

class UserAppointmentCardWidget extends StatelessWidget {
  const UserAppointmentCardWidget({Key? key,required this.doctorData, required this.data})
      : super(key: key);
  final UserAppointments data;
  final Body doctorData;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DoctorProfilePage(id: data.doctorID)));

      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 0,
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(doctorData.profileImagePath!),
              ),
              title: RichText(
                  text: TextSpan(
                      text: 'Doctor  ',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                            text: doctorData.doctorName!.englishName!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500))
                      ])),
              subtitle:Text(" ${data.appointmentDay!}  At  ${data.appointmentHour!}" ) ,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor:   MaterialStateProperty.resolveWith((state) => ColorManager.lightBlueBackgroundColor),
                            foregroundColor:
                            MaterialStateProperty.resolveWith((state) => ColorManager.lightBlueTextColor)),
                        onPressed: (){
                          showDialog(context: context, builder: (context)=>  DoctorInfoAppointmentPopup(
                              data: {"doctorData": doctorData, "userData": data}))
                          ;




                    }, icon:const Icon(Icons.account_circle_outlined), label:const  Text("More Information")),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton.icon(

                      onPressed: () async{
                        SharedPreferences prefs =  await SharedPreferences.getInstance();
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: const Text("Are you want to remove this appointment?"),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  TextButton.icon(
                                    style: ButtonStyle(
                                        foregroundColor:
                                        MaterialStateProperty.resolveWith((state) => Colors.red)),
                                    onPressed: () {


                                      UserController().removeUserAppointments(doctorData.id!, {
                                        "userAppointments":{
                                          "doctorID":doctorData.id!,
                                          "appointmentDay":
                                          data.appointmentDay,
                                          "appointmentHour":
                                          data.appointmentHour,
                                        },
                                        "doctorData":{
                                          "clientName": prefs.getString('userName'),
                                          "clientPhoneNumber": prefs.getString('phoneNumber')
                                        }

                                      }).then((value) => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainPage())));
                                    },
                                    icon: const Icon(Icons.restore_from_trash_outlined),
                                    label: Text(
                                      'Remove',
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.exit_to_app_outlined),
                                    label: Text(
                                      'Cancel',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        });

                      },
                      icon:  Icon(Icons.restore_from_trash_outlined,),
                      label: Text('Remove'),
                      style: ButtonStyle(
                        backgroundColor:   MaterialStateProperty.resolveWith((state) => ColorManager.lightBlueBackgroundColor),
                          foregroundColor:
                          MaterialStateProperty.resolveWith((state) => ColorManager.lightBlueTextColor)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
