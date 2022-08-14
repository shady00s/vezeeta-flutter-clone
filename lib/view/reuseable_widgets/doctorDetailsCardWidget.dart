

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vezeeta_clone/model/doctorModel.dart';

import '../managers/colorsManager.dart';




class DoctorDetailsCard extends StatefulWidget {
  const DoctorDetailsCard({Key? key, required this.doctor }) : super(key: key);
    final Body doctor;
  @override
  State<DoctorDetailsCard> createState() => _DoctorDetailsCardState();
}

class AppointmentClass{
  late final String hour;
  late final String day;
  AppointmentClass({required this.hour, required this.day});
}
class DoctorInfoTest {
  late final  String clinicLocation;
  late final  String fees;
  late final  String address;
  late final  String waitingTime;
  late final  List<AppointmentClass> availableAppointment;

  DoctorInfoTest({required this.clinicLocation,required this.address,required this.fees, required this.availableAppointment,required this.waitingTime});
}


class _DoctorDetailsCardState extends State<DoctorDetailsCard> {
  Random random =  Random();
  List<bool>isSelectedList = [true ,false];
  int clinicIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DoctorInfoTest> testList =[
      DoctorInfoTest(clinicLocation: widget.doctor.doctorClinics![0].place![0].placeEnglish!, address: " 12th  ${widget.doctor.doctorClinics![0].place![0].placeEnglish!}, floor 12",  fees: widget.doctor.fees!, availableAppointment: [AppointmentClass(hour: '4:00 PM', day: '27/3 Monday'),AppointmentClass(hour: '04:00 PM', day: '28/3 tuesday'),AppointmentClass(hour: '04:00 PM', day: '29/3 Wednesday')], waitingTime: "35 minuets")
      ,DoctorInfoTest(clinicLocation: widget.doctor.doctorClinics![1].place![1].placeEnglish!, address: "30th ${widget.doctor.doctorClinics![1].place![1].placeEnglish!}, floor 31",  fees: widget.doctor.fees!, availableAppointment: [AppointmentClass(hour: '4:00 PM', day: '27/3 Monday'),AppointmentClass(hour: '04:00 PM', day: '28/3 tuesday'),AppointmentClass(hour: '04:00 PM', day: '29/3 Wednesday')], waitingTime: "35 minuets")
    ];
    List<Widget> texts = testList.map((e) =>  Padding(
      padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width /12 ,vertical: 2),
      child: Text(e.clinicLocation),
    )).toList();
    return DecoratedBox(

      decoration: const BoxDecoration(color: Colors.white),
      child: Column(

        children: [
         //clinic locations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: SizedBox(
              height: 40,

              child: ToggleButtons(
                borderRadius: BorderRadius.circular(13),
                  isSelected: isSelectedList,
                  selectedColor: ColorManager.lightBlueTextColor,
                  selectedBorderColor: ColorManager.lightBlueTextColor,
                  disabledBorderColor: Colors.grey,
                  fillColor: ColorManager.lightBlueBackgroundColor,
                  children:texts,
                onPressed: (int newIndex){
                    setState(() {
                      for(int index = 0; index < isSelectedList.length;index++) {
                        if (index == newIndex) {
                          isSelectedList[index] = true;
                          clinicIndex = newIndex;
                        }
                        else {
                          isSelectedList[index] = false;
                          clinicIndex = newIndex;
                        }
                      }
                    });
              }
                ,
              ),
            ),
          ),


          // clinic info
        // fees
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(

              children:  [
                const Icon(Icons.wallet,color: ColorManager.lightBlueTextColor,),
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${testList[clinicIndex].fees} EGP"),
                    const SizedBox(height: 10,),
                    const Text("Consultant fees" ,style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),

          // address
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(

              children:  [
                const Icon(Icons.wallet,color: ColorManager.lightBlueTextColor,),
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(testList[clinicIndex].address),
                    const SizedBox(height: 10,),
                    const Text("Book and you will receive the address details." ,style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
