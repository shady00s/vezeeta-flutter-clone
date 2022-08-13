

import 'package:flutter/material.dart';
import 'package:vezeeta_clone/model/doctorModel.dart';

import '../managers/colorsManager.dart';




class DoctorDetailsCard extends StatefulWidget {
  const DoctorDetailsCard({Key? key, }) : super(key: key);

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
  List<DoctorInfoTest> testList =[
    DoctorInfoTest(clinicLocation: "Abbasia", address: "43 abbasia street cairo", fees: "300", availableAppointment: [AppointmentClass(hour: '4:00 PM', day: '27/3 Monday'),AppointmentClass(hour: '04:00 PM', day: '28/3 tuesday'),AppointmentClass(hour: '04:00 PM', day: '29/3 Wednesday')], waitingTime: "35 minuets")
    ,DoctorInfoTest(clinicLocation: "Naser city", address: "43 abbasia street cairo", fees: "300", availableAppointment: [AppointmentClass(hour: '4:00 PM', day: '27/3 Monday'),AppointmentClass(hour: '04:00 PM', day: '28/3 tuesday'),AppointmentClass(hour: '04:00 PM', day: '29/3 Wednesday')], waitingTime: "35 minuets")
  ];
  List<bool>isSelectedList = [true ,false];


  @override
  Widget build(BuildContext context) {
    List<Widget> texts = testList.map((e) =>  Padding(
      padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width /8 ,vertical: 5),
      child: Text(e.clinicLocation),
    )).toList();
    return DecoratedBox(

      decoration: BoxDecoration(color: Colors.white),
      child: Column(

        children: [
         //clinic locations

          Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
                        }
                        else {
                          isSelectedList[index] = false;
                        }
                      }
                    });
              }
                ,
              ),
            ),
          ),



        ],
      ),
    );
  }
}
