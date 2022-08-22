import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vezeeta_clone/data/controller/userController.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';

import '../../reuseable_widgets/userAppointmentCard.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(

        children: [
          Text("My Activity",style: TextStyling.titleStyleText,),
            StreamBuilder<dynamic>(
                stream:  UserController().showUserAppointments(),
                builder: (context,snapshot){

              switch(snapshot.connectionState){
                case ConnectionState.none:

                case ConnectionState.waiting:
                 return Center(child: CircularProgressIndicator(),);
                case ConnectionState.active:

                case ConnectionState.done:
                  if(snapshot.hasData){
                    UserBody? data = snapshot.data['userData'];
                    List? doctorData =  snapshot.data['doctorData'];
                    return Expanded(
                      child: ListView.separated(separatorBuilder:(context,index)=> Divider(), itemCount: data!.userAppointments!.length,  itemBuilder: (context,index){
                        return   UserAppointmentCardWidget(data: data.userAppointments![index], doctorData: doctorData![index],);
                      }, ),
                    );
                  }
                else{
                  return const Center(child: Text('No Activites'),);
                  }

              }
            })

        ],
      ),
    );
  }
}
