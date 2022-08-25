import 'package:flutter/material.dart';
import 'package:vezeeta_clone/data/controller/userController.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/subPages/doctorProfilePage.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/textFormWidget.dart';

import '../../../data/model/doctorModel.dart';

class SearchByNameScreen extends StatefulWidget {
  const SearchByNameScreen({Key? key}) : super(key: key);

  @override
  State<SearchByNameScreen> createState() => _SearchByNameScreenState();
}

class _SearchByNameScreenState extends State<SearchByNameScreen> {
  @override
  void initState() {

    super.initState();
  }
  TextEditingController search = TextEditingController();
  String textVal = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Doctors'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width - 90,
                  height: 90,
                  child: TextFormWidget(
                      hintText: "search by doctor name",
                      prefixIcon: Icons.search,
                      controller: search,
                      inputType: TextInputType.text)),
              Center(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        textVal = search.text;
                      });
                      print(textVal);
                    },
                    child: Text('Search')),
              )
            ],
          ),
          textVal != ''
              ? Expanded(
                  child: FutureBuilder<List<Body>>(
                  future: UserController().searchByName(textVal),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:

                      case ConnectionState.waiting:
                        return Expanded(
                            child: Center(
                          child: CircularProgressIndicator(),
                        ));
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          List<Body> doctorData = snapshot.data;
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return Card(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DoctorProfilePage(
                                                      id: doctorData[index]
                                                          .id)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(
                                                doctorData[index]
                                                    .profileImagePath!),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                  text: TextSpan(
                                                      text: 'Doctor  ',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                      children: [
                                                        TextSpan(
                                                            text: doctorData[index]
                                                                .doctorName!
                                                                .englishName,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                FontWeight.w500))
                                                      ])),
                                              SizedBox(height: 5,),
                                              Text(doctorData[index].doctorSpecialization!.specializationEnglish!)
                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: doctorData.length);
                        } else {
                          return Center(
                            child: Text(" No Doctors."),
                          );
                        }
                    }
                  },
                ))
              : Text('')
        ],
      ),
    );
  }
}
