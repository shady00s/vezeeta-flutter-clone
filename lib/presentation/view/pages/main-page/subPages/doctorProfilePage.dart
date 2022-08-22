import 'package:flutter/material.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';

import '../../../../../data/controller/doctorController.dart';
import '../../../../../data/model/doctorModel.dart';
import '../../../reuseable_widgets/doctorCardWidget.dart';
import '../../../reuseable_widgets/doctorDetailsCardWidget.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key, required this.id}) : super(key: key);
  final String? id;
  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    print('in doctorDetailPage ${widget.id}');
    return Scaffold(
        appBar: AppBar(
          title: Text("Doctor Profile"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.heart_broken)),
          ],
        ),
        body: StreamBuilder <Body>(
            stream: DoctorController().getDoctorData(widget.id!),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:

                case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                case ConnectionState.active:

                case ConnectionState.done:
                  if (snapshot.hasData) {
                  Body dr = snapshot.data!;

                    print(dr);
                   return SingleChildScrollView(
                      child: Column(
                        children: [
                          DoctorCardMini(
                            doctor: dr,
                          ),
                          const SizedBox(height: 10),

                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child:  DoctorDetailsCard( doctor: dr,)),

                          // clinic images
                          SizedBox(child: DecoratedBox(decoration: BoxDecoration(color: Colors.white),child:

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                const Text("Clinic Image",style: TextStyling.titleStyleText,),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Image(image: NetworkImage(dr.clinicImagesPath![0].image!), width: 80, height: 80,fit: BoxFit.cover,),
                                    Image(image: NetworkImage(dr.clinicImagesPath![1].image!),width: 80, height: 80,fit: BoxFit.cover,),
                                    Image(image: NetworkImage(dr.clinicImagesPath![2].image!),width: 80, height: 80,fit: BoxFit.cover,),
                                  ],),
                              ],
                            ),
                          )

                            ,),)

                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
              }
            }));
  }
}
