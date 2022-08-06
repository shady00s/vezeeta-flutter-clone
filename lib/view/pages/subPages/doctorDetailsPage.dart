
import 'package:flutter/material.dart';
import 'package:vezeeta_clone/controller/doctorController.dart';
import 'package:vezeeta_clone/model/doctorModel.dart';

import '../../reuseable_widgets/doctorCardWidget.dart';
import '../../reuseable_widgets/doctorDetailsCardWidget.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({Key? key,required this.id}) : super(key: key);
  final String? id;
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
      
      StreamBuilder<DoctorModel>(
        stream: DoctorController().getDoctorInformation(widget.id ),
        builder: (context, snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator(),);
            case ConnectionState.active:

            case ConnectionState.done:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    DoctorCardMini(doctor: snapshot.data,),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child:  DoctorDetailsCard(doctor: snapshot.data,)

                    )
                    ,

                  ],
                ),

              );
          }

        }
      ) ,
    );
  }
}
