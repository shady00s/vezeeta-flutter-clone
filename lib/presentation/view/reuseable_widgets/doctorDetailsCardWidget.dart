import 'dart:math';
import 'package:flutter/material.dart';
import '../../../data/model/doctorModel.dart';
import '../managers/colorsManager.dart';
import '../managers/textStyleManager.dart';
import 'appointmentCardWidget.dart';

class DoctorDetailsCard extends StatefulWidget {
  const DoctorDetailsCard({Key? key, required this.doctor}) : super(key: key);
  final Body doctor;
  @override
  State<DoctorDetailsCard> createState() => _DoctorDetailsCardState();
}

class AppointmentClass {
  late final String hour;
  late final String day;
  AppointmentClass({required this.hour, required this.day});
}

class DoctorInfoTest {
  late final String clinicLocation;
  late final String fees;
  late final String address;
  late final String waitingTime;
  late final List<AppointmentClass> availableAppointment;

  DoctorInfoTest(
      {required this.clinicLocation,
      required this.address,
      required this.fees,
      required this.availableAppointment,
      required this.waitingTime});
}

class _DoctorDetailsCardState extends State<DoctorDetailsCard> {
  Random random = Random();
  List<bool> isSelectedList = [true, false];
  int clinicIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DoctorInfoTest> testList = [
      DoctorInfoTest(
          clinicLocation:
              widget.doctor.doctorClinics![0].place![0].placeEnglish!,
          address:
              " 12th  ${widget.doctor.doctorClinics![0].place![0].placeEnglish!}, floor 12",
          fees: widget.doctor.fees!,
          availableAppointment: [
            AppointmentClass(
                hour: widget
                    .doctor.doctorClinics![0].clinicAppointment![0].time1!,
                day: widget
                    .doctor.doctorClinics![0].clinicAppointment![0].day1!),
            AppointmentClass(
                hour: widget
                    .doctor.doctorClinics![0].clinicAppointment![1].time2!,
                day: widget
                    .doctor.doctorClinics![0].clinicAppointment![1].day2!),
            AppointmentClass(
                hour: widget
                    .doctor.doctorClinics![0].clinicAppointment![2].time3!,
                day:
                    widget.doctor.doctorClinics![0].clinicAppointment![2].day3!)
          ],
          waitingTime: "35 minuets"),
      DoctorInfoTest(
          clinicLocation:
              widget.doctor.doctorClinics![1].place![0].placeEnglish!,
          address:
              "30th ${widget.doctor.doctorClinics![1].place![0].placeEnglish!}, floor 31",
          fees: widget.doctor.fees!,
          availableAppointment: [
            AppointmentClass(
                hour: widget
                    .doctor.doctorClinics![1].clinicAppointment![0].sectime1!,
                day: widget
                    .doctor.doctorClinics![1].clinicAppointment![0].secday1!),
            AppointmentClass(
                hour: widget
                    .doctor.doctorClinics![1].clinicAppointment![1].sectime2!,
                day: widget
                    .doctor.doctorClinics![1].clinicAppointment![1].secday2!),
            AppointmentClass(
                hour: widget
                    .doctor.doctorClinics![1].clinicAppointment![2].sectime3!,
                day:
                widget.doctor.doctorClinics![1].clinicAppointment![2].sectime3!)
          ],
          waitingTime: "35 minuets")
    ];
    List<Widget> texts = testList
        .map((e) => SizedBox(
              width: 160,
              child: Text(
                e.clinicLocation,
                textAlign: TextAlign.center,
              ),
            ))
        .toList();
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          //clinic locations
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SizedBox(
              height: 40,
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(13),
                isSelected: isSelectedList,
                selectedColor: ColorManager.lightBlueTextColor,
                selectedBorderColor: ColorManager.lightBlueTextColor,
                disabledBorderColor: Colors.grey,
                fillColor: ColorManager.lightBlueBackgroundColor,
                children: texts,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0;
                        index < isSelectedList.length;
                        index++) {
                      if (index == newIndex) {
                        isSelectedList[index] = true;
                        clinicIndex = newIndex;
                      } else {
                        isSelectedList[index] = false;
                        clinicIndex = newIndex;
                      }
                    }
                  });
                },
              ),
            ),
          ),

          // clinic info
          // fees and waiting time

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.wallet,
                      color: ColorManager.lightBlueTextColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${testList[clinicIndex].fees} EGP"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Consultant fees",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.access_time,
                    color: ColorManager.lightBlueTextColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.doctor.clinicWaitingTime} Minutes"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Waiting Time",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.black26,
          ),
          // address
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: ColorManager.lightBlueTextColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(testList[clinicIndex].address),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Book and you will receive the address details.",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.black26,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Choose your appointment",
            style: TextStyling.titleStyleText,
          ),
          // appointment widget
           Padding(
           padding: const EdgeInsets.only(top: 14.0, bottom: 8.0),
            child: AppointmentCardWidget(appointmentList:testList)),

          const Text(
            "Time slot reservation",
            style: TextStyling.subTitleStyleText,
          ),
          const Divider()
        ],
      ),
    );
  }
}
