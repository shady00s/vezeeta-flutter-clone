import 'package:flutter/material.dart';

class UserAppointmentCardWidget extends StatelessWidget {
  const UserAppointmentCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
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
                          text: "sdf",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500))
                    ])),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Fees  ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                      TextSpan(
                          text: "21 LE",
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
                        text: 'Location  ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                      TextSpan(
                          text: "21 LE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500))
                    ])),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Day  ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: [
                          TextSpan(
                              text: "21 LE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500))
                        ])),
                    SizedBox(width: 20,),
                    RichText(
                        text: TextSpan(
                            text: 'Time  ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: [
                          TextSpan(
                              text: "21 LE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500))
                        ]))
                  ],
                )
              ],
            )
            ,Spacer(),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: TextButton(onPressed: () {

              },
              child: Text('Remove'),),
            )
          ],
        ),
      ),
    );
  }
}
