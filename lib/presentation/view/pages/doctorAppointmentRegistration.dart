import 'package:flutter/material.dart';
import 'package:vezeeta_clone/presentation/view/managers/colorsManager.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/submitButton.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/textFormWidget.dart';

import '../../../data/controller/userController.dart';
import '../../../data/model/doctorModel.dart';
import 'main-page/main-page.dart';

class DoctorAppointmentRegistrationScreen extends StatefulWidget {
  const DoctorAppointmentRegistrationScreen(
      {Key? key, required this.doctorData, required this.selectedAppointments})
      : super(key: key);
  final Body doctorData;
  final dynamic selectedAppointments;

  @override
  State<DoctorAppointmentRegistrationScreen> createState() =>
      _DoctorAppointmentRegistrationScreenState();
}

class Data {
  final String doctorID;
  final String appointmentDay;
  final String appointmentHour;
  final String clientName;
  final String clientPhoneNumber;
  Data({
    required this.doctorID,
    required this.appointmentDay,
    required this.appointmentHour,
    required this.clientName,
    required this.clientPhoneNumber,
  });
}

class _DoctorAppointmentRegistrationScreenState
    extends State<DoctorAppointmentRegistrationScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: Stack(
              children: [
                // doctor title
                Positioned(
                    top: 90,
                    left: 20,
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width - 30,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Doctor  ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(59, 56, 56, 1.0)),
                                    children: [
                                  TextSpan(
                                    text: widget
                                        .doctorData.doctorName!.englishName!,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  )
                                ])),
                            SizedBox(
                              height: 15,
                            ),
                            Text(widget.doctorData.doctorSpecialization!
                                .specializationEnglish!)
                          ],
                        ),
                      ),
                    )),
                // doctor image
                Positioned(
                    top: 30,
                    left: MediaQuery.of(context).size.width * 0.40,
                    child: CircleAvatar(
                      foregroundImage:
                          NetworkImage(widget.doctorData.profileImagePath!),
                      radius: 40,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          // appointment info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Card(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // phone number and name
                      IntrinsicHeight(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_circle_outlined,
                              color: ColorManager.lightBlueTextColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 160,
                              width: MediaQuery.of(context).size.width - 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormWidget(
                                        hintText: "Full name:",
                                        prefixIcon: Icons.edit,
                                        controller: name,
                                        inputType: TextInputType.text),
                                  ),
                                  Expanded(
                                    child: TextFormWidget(
                                        hintText: "Phone number:",
                                        prefixIcon: Icons.call,
                                        controller: phoneNumber,
                                        inputType: TextInputType.number),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),

                      // day and hour
                      IntrinsicHeight(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              color: ColorManager.lightBlueTextColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                                height: 70,
                                width: MediaQuery.of(context).size.width - 120,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(widget.selectedAppointments['time']),
                                      Text(widget.selectedAppointments['day'])
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                      //location
                      IntrinsicHeight(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: ColorManager.lightBlueTextColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 120,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      widget.selectedAppointments['address']),
                                ))
                          ],
                        ),
                      )),
                      // fees
                      IntrinsicHeight(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wallet,
                              color: ColorManager.lightBlueTextColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Fees',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(widget.doctorData.fees! + " LE")
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width - 30,
            child: SubmitButtonWidget(
              onSubmit: () {
                UserController().userAddAppointment(

                        widget.doctorData.id!,
                    {
                      "userAppointments":{
                        "doctorID": widget.doctorData.id!,
                        "appointmentDay":
                        widget.selectedAppointments['day'].toString(),
                        "appointmentHour":
                        widget.selectedAppointments['time'].toString(),
                      },
                      "doctorData":{
                        "clientName": name.text,
                        "clientPhoneNumber": phoneNumber.text
                      }

                          })
                    .then((value) {
                  if (value == true) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  }
                });
              },
              buttonText: ' Confirm',
            ),
          ),

          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
