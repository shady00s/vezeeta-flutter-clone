import 'package:flutter/material.dart';

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
