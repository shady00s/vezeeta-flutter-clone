import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';

import '../../../managers/colorsManager.dart';
import '../../../managers/textStyleManager.dart';
import '../../../reusable_screens/SearchByNameScreen.dart';
import 'selectCityPage.dart';

List<String> _categories = [
  "Dermatology",
  "Dentistry",
  "Psychiatry",
  "Pediatrics and New Born",
  "Neurology",
  "Orthopedics",
  "Gynaecology and Infertility",
  "Ear,Nose and Throat",
  "Cardiology and Vascular Disease",
  "Allergy abd Immunology",
];

List<String> _Othercategories = [
  "Andrology and Male Infertility",
  "Audiology",
  "Cariology and Thoracic Surgery",
  "Chest and Respiratory",
  "Diabetes and Endocrinology",
  "Diagnostic Radiology",
  "Dietitian and Nutrition",
  "Family Medicine",
  "Gastroenterology and Endoscopy",
  "General Surgery",
  "Geriatrics",
  "Hematology",
  "Internal Medicine",
  "IVF and Infertility",
  "Laboratories",
  "Neurosurgery",
  "Obesity and Laparoscopic Surgery",
];

class DoctorCategoriesPage extends StatelessWidget {
  const DoctorCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.appBarColor,
        elevation: 0,
        title: Text("Search for doctor"),
        leading: IconButton(icon:const Icon(Icons.arrow_back),onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainPage())),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchByNameScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Text(
                            "search for,doctor",
                            style: TextStyling.subTitleStyleText,
                          )
                        ],
                      ),
                    ),
                  )),
            )  ,
            const SizedBox(height: 10,),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Most Popular Specialities",
                    style: TextStyling.titleStyleText,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        return DecoratedBox(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorManager.separatorColor,
                                      width: 1))),
                          child: SizedBox(
                            height: 80,
                            child: InkWell(
                              onTap: () {
                                SharedPreferences.getInstance().then((value) {
                                  value.setString("doctorSpecialization", _categories[index]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SelectCityPage()));
                                });
                              },
                              child: Row(
                                children: [
                                  Text(_categories[index]),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 28.0),
                    child: Text(
                      "Most Popular Specialities",
                      style: TextStyling.titleStyleText,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _Othercategories.length,
                      itemBuilder: (context, index) {
                        return DecoratedBox(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorManager.separatorColor))),
                          child: SizedBox(
                            height: 60,
                            child: InkWell(
                              onTap: () {
                                SharedPreferences.getInstance().then((value) {
                                  value.setString(
                                    "doctorSpecialization",
                                    _Othercategories[index],
                                  );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SelectCityPage()));
                                });

                              },
                              child: Row(
                                children: [
                                  Text(_Othercategories[index]),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
