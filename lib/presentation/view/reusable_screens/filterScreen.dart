import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/submitButton.dart';

import '../pages/main-page/subPages/doctorsResultPage.dart';
enum DoctorGender {male,female}
enum DoctorRating {highestRate,lowestRate}
enum Entity {hospital,clinic}
class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
   DoctorGender  _gender = DoctorGender.male;
   DoctorRating _rating = DoctorRating.highestRate;
   Entity _entity = Entity.hospital;


  Map<String , dynamic> filter = {
    
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter doctors'),

      ),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
                  const Text("Gender",style: TextStyling.titleStyleText,),
                  const SizedBox(height: 20,),
                  Row(

                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Text("Male"),
                          title:  Radio<DoctorGender>(value: DoctorGender.male, groupValue: _gender, onChanged: (DoctorGender? value){
                            setState(() {
                              _gender = value!;
                              filter['doctorGender'] = "male";
                            });
                          }),
                        ),
                      ),
                     
                     Expanded(
                       child: ListTile(
                         leading: const Text("Female"),
                         title:  Radio<DoctorGender>(value: DoctorGender.female, groupValue: _gender, onChanged: (DoctorGender? value){
                           setState(() {
                             _gender = value!;
                             filter['doctorGender'] = "female";
                           });
                         }),
                       ),
                     )
                   ,


                  ],),


              const SizedBox(height: 20,),

              const Divider(),
              const Text("Rating",style: TextStyling.titleStyleText,),
              const SizedBox(height: 20,),
              Row(

                children: [
                  
                  Expanded(
                    child: ListTile(
                      leading:const Text("Highest to lowest") ,
                      title:  Radio<DoctorRating>(value: DoctorRating.highestRate, groupValue: _rating, onChanged: (DoctorRating? value){
                        setState(() {
                          _rating = value!;
                          filter['doctorSorting'] = "highestRate";
                        });
                      }),
                    ),
                  ),
                  
                  Expanded(
                    child: ListTile(
                      leading:const Text("Lowest to highest") ,
                      title:  Radio<DoctorRating>(value: DoctorRating.lowestRate, groupValue: _rating, onChanged: (DoctorRating? value){
                        setState(() {
                          _rating = value!;
                          filter['doctorSorting'] = "lowestRate";
                        });
                      }),
                    ),
                  )

                ],),

              const SizedBox(height: 20,),

              const Divider(),
              const Text("Entity",style: TextStyling.titleStyleText,),
              const SizedBox(height: 20,),
              Row(

                children: [
                  
                  Expanded(
                    child: ListTile(
                      leading:const Text("Hospital"),
                      title:  Radio<Entity>(value: Entity.hospital, groupValue: _entity, onChanged: (Entity? value){
                        setState(() {
                          _entity = value!;
                          filter['doctorEntity'] = "hospital";
                        });
                      }),
                    ),
                  ),
                  
                  Expanded(
                    child: ListTile(
                      leading:const Text("Clinic"),
                      title:  Radio<Entity>(value: Entity.clinic, groupValue: _entity, onChanged: (Entity? value){
                        setState(() {
                          _entity = value!;
                          filter['doctorEntity'] = "clinic";
                        });
                      }),
                    ),
                  ),
            ],
          ),

              const SizedBox(height: 20,),

              const Divider(),
              const Spacer(),
              SubmitButtonWidget(onSubmit: (){

                SharedPreferences.getInstance().then((value) {
                  String city = value.getString("city") ?? '';
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DoctorsListPage(filter:filter,cityName: city ))) ;

                });
              }, buttonText: "Filter")
        ]))
    );
  }
}
