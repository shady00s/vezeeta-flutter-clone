import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/subPages/doctorProfilePage.dart';

import '../../../data/controller/userController.dart';
import '../managers/colorsManager.dart';
import '../pages/main-page/main-page.dart';

class DoctorInfoAppointmentPopup extends StatelessWidget {
  const DoctorInfoAppointmentPopup({Key? key, required this.data})
      : super(key: key);
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: RichText(
          text: TextSpan(
              text: 'Doctor  ',
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
            TextSpan(
                text: data['doctorData'].doctorName!.englishName!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500))
          ])),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 5,
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(data['doctorData'].profileImagePath!),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 9),
            child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Appointment Info:",
                  style: TextStyling.titleStyleText,
                  textAlign: TextAlign.start,
                )),
          ),
          // day
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Day:"), Text(data['userData'].appointmentDay)],
          ),
          const SizedBox(
            height: 10,
          ),
          // hour
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hour:"),
              Text(data['userData'].appointmentHour)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // fees

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Fees:"),
              Text(data['doctorData'].fees! + "  LE")
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Expanded(child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (state) => ColorManager.lightBlueBackgroundColor),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (state) => ColorManager.lightBlueTextColor)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DoctorProfilePage(id: data['doctorData'].id!)));
                },
                icon: const Icon(Icons.account_circle_outlined),
                label: Text(
                  'Doctor Profile',
                ),
              ),
            ),),

            Expanded(child:  Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (state) => ColorManager.lightBlueBackgroundColor),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (state) => ColorManager.lightBlueTextColor)),
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Are you want to remove this appointment?"),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton.icon(
                                  style: ButtonStyle(
                                      foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                              (state) => Colors.red)),
                                  onPressed: () {
                                    UserController().removeUserAppointments(
                                        data['doctorData'].id!, {
                                      "userAppointments": {
                                        "doctorID": data['doctorData'].id!,
                                        "appointmentDay":
                                        data['userData'].appointmentDay,
                                        "appointmentHour":
                                        data['userData'].appointmentHour,
                                      },
                                      "doctorData": {
                                        "clientName": prefs.getString('userName'),
                                        "clientPhoneNumber":
                                        prefs.getString('phoneNumber')
                                      }
                                    }).then((value) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const MainPage())));
                                  },
                                  icon: const Icon(
                                      Icons.restore_from_trash_outlined),
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
                icon: const Icon(Icons.restore_from_trash_outlined),
                label: Text(
                  'Remove',
                ),
              ),
            ))

          ],
        )
      ],
    );
  }
}
