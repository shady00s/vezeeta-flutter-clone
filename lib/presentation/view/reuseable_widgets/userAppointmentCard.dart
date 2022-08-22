import 'package:flutter/material.dart';
import 'package:vezeeta_clone/data/model/doctorModel.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/subPages/doctorProfilePage.dart';

class UserAppointmentCardWidget extends StatelessWidget {
  const UserAppointmentCardWidget({Key? key,required this.doctorData, required this.data})
      : super(key: key);
  final UserAppointments data;
  final Body doctorData;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorProfilePage(id: doctorData.id)));
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(doctorData.profileImagePath!),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
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
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Fees  ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                        TextSpan(
                            text: "${ doctorData.fees} LE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500))
                      ])),
                  SizedBox(
                    height: 5,
                  ),

                  SizedBox(
                    height: 5,
                  ),

                      RichText(
                          text: TextSpan(
                              text: 'Day  ',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                            TextSpan(
                                text: data.appointmentDay,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500))
                          ])),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Time  ',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                            TextSpan(
                                text: data.appointmentHour,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500))
                          ]))

                ],
              ),
              Spacer(),
              Stack(alignment: AlignmentDirectional.topStart, children: [
                TextButton(
                  onPressed: () {},
                  child: Icon(Icons.restore_from_trash_outlined,color: Colors.red,),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
