import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/submitButton.dart';

import '../pages/main-page/subPages/doctorsResultPage.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  Map<String , dynamic> filter = {
    
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter doctors'),

      ),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
                  Text("Gender",style: TextStyling.titleStyleText,),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    TextButton(onPressed: (){
                      setState(() {
                        filter['doctorGender'] = "male";
                      });

                    }, child: Text("Male")),
                    TextButton(onPressed: (){
                      setState(() {
                        filter['doctorGender'] = "female";
                      });
                    }, child: Text("Female")),
                  ],),


              SizedBox(height: 20,),

              Divider(),
              Text("Rating",style: TextStyling.titleStyleText,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      filter['doctorSorting'] = "highestRate";
                    });
                  }, child: Text("Highest to lowest")),
                  TextButton(onPressed: (){
                    setState(() {
                      filter['doctorSorting'] = "lowestRate";
                    });
                  }, child: Text("Lowest to highest")),
                ],),

              SizedBox(height: 20,),

              Divider(),
              Text("Entity",style: TextStyling.titleStyleText,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      filter['doctorEntity'] = "hospital";
                    });
                  }, child: Text("Hospital")),
                  TextButton(onPressed: (){
                    setState(() {
                      filter['doctorEntity'] = "clinic";
                    });
                  }, child: Text("Clinic")),
                ],),

              SizedBox(height: 20,),

              Divider(),
            Spacer(),
              SubmitButtonWidget(onSubmit: (){
                print( filter);
                print(filter['doctorGender']);
                SharedPreferences.getInstance().then((value) {
                  String city = value.getString("city") ?? '';
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DoctorsListPage(filter:filter,cityName: city ))) ;

              });
              }, buttonText: "Filter")
            ],
          ),
        )
    );
  }
}
