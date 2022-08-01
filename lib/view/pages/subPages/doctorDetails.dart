
import 'package:flutter/material.dart';

import '../../reuseable_widgets/doctorCard.dart';
import '../../reuseable_widgets/doctorDetailsCard.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Profile"),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined)),
            IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken)),
          ],
      ),
      body:
        SingleChildScrollView(
          child: Column(
          children: [
            DoctorCardMini(),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DoctorDetailsCard()
              ,
            )
          ],
        ),

      ) ,
    );
  }
}
