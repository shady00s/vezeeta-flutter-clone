
import 'package:flutter/material.dart';
import 'package:vezeeta_clone/controller/doctorController.dart';
import 'package:vezeeta_clone/model/doctorModel.dart';

import '../../../reuseable_widgets/doctorCardWidget.dart';
import '../../../reuseable_widgets/doctorDetailsCardWidget.dart';



class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key,required this.id}) : super(key: key);
  final String? id;
  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    print('in doctorDetailPage ${widget.id}' );
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Profile"),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined)),
            IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken)),
          ],
      ),
      body: 
      Center(child: Text(""),)
      // StreamBuilder<DoctorDetailsModel>(
      //   stream: DoctorController().getDoctorInformation(widget.id! ),
      //   builder: (context, snapshot) {
      //     DoctorDetailsModel? dr = snapshot.data;
      //     if(snapshot.hasData){
      //       switch (snapshot.connectionState) {
      //         case ConnectionState.none:
      //
      //         case ConnectionState.waiting:
      //
      //         case ConnectionState.active:
      //           return const Center(child: CircularProgressIndicator(),);
      //         case ConnectionState.done:
      //           return SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 DoctorCardMini(doctor:  dr!.body!,),
      //                 const SizedBox(height: 10),
      //                 SizedBox(
      //                     width: MediaQuery.of(context).size.width,
      //                     child:  DoctorDetailsCard(doctor: snapshot.data,)
      //
      //                 )
      //                 ,
      //
      //               ],
      //             ),
      //
      //           );
      //       }
      //     }
      //
      //     else{
      //       return const Center(child: CircularProgressIndicator(),);
      //     }
      //
      //   }
      // ) ,
    );
  }
}
