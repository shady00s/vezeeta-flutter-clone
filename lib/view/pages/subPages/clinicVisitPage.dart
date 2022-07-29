import 'package:flutter/material.dart';
import 'package:vezeeta_clone/view/pages/subPages/doctorsResultPage.dart';
import 'package:vezeeta_clone/view/pages/subPages/selectCityPage.dart';
import 'package:vezeeta_clone/view/styles/textStyle.dart';
import 'package:vezeeta_clone/view/styles/colors.dart';
import '../../reuseable_widgets/textForm.dart';
class _DrCategories {
 late final String name;
 late final String ImagePath;
 _DrCategories(  this.name, this.ImagePath);
}
List<_DrCategories> _categories = [
  _DrCategories("Dermatology","sadasds"),
  _DrCategories("Dentistry","sadasds"),
  _DrCategories("Psychiatry","sadasds"),
  _DrCategories("Pediatrics and New Born","sadasds"),
  _DrCategories("Neurology","sadasds"),
  _DrCategories("Orthopedics","sadasds"),
  _DrCategories("Gynaecology and Infertility","sadasds"),
  _DrCategories("Ear,Nose and Throat","sadasds"),
  _DrCategories("Cardiology and Vascular Disease","sadasds"),
  _DrCategories("Allergy abd Immunology","sadasds"),

];

List<_DrCategories> _Othercategories = [
  _DrCategories("Andrology and Male Infertility","sadasds"),
  _DrCategories("Audiology","sadasds"),
  _DrCategories("Cariology and Thoracic Surgery","sadasds"),
  _DrCategories("Chest and Respiratory","sadasds"),
  _DrCategories("Diabetes and Endocrinology","sadasds"),
  _DrCategories("Diagnostic Radiology","sadasds"),
  _DrCategories("Dietitian and Nutrition","sadasds"),
  _DrCategories("Family Medicine","sadasds"),
  _DrCategories("Gastroenterology and Endoscopy","sadasds"),
  _DrCategories("General Surgery","sadasds"),
  _DrCategories("Geriatrics","sadasds"),
  _DrCategories("Hematology","sadasds"),
  _DrCategories("Internal Medicine","sadasds"),
  _DrCategories("IVF and Infertility","sadasds"),
  _DrCategories("Laboratories","sadasds"),
  _DrCategories("Neurosurgery","sadasds"),
  _DrCategories("Obesity and Laparoscopic Surgery","sadasds"),


];

class ClincVisitPage extends StatelessWidget {
  const ClincVisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.appBarColor,
        elevation: 0,
        title: Text("Search for doctor"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormWidget(),
            Expanded(child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Most Popular Specialities",style: TextStyling.titleStyleText,),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _categories.length,

                      itemBuilder: (context,index){
                        return
                          DecoratedBox(decoration:
                            const BoxDecoration(
                              border: Border(bottom: BorderSide(color: ColorManager.separatorColor,width: 1))
                            )
                            ,child:  SizedBox(
                            height: 80,
                            child:
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectCityPage()
                                ));
                              },
                              child: Row(
                                children: [
                                  Text(_categories[index].name.toString()),
                                ],
                              ),
                            ),
                          ),)
                         ;
                      }),
                  const  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 28.0),
                    child:  Text("Most Popular Specialities",style: TextStyling.titleStyleText,),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _Othercategories.length,

                      itemBuilder: (context,index){
                        return
                          DecoratedBox(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: ColorManager.separatorColor))),
                          child: SizedBox(
                            height: 60,
                            child:
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectCityPage()));
                              },
                              child: Row(
                                children: [
                                  Text(_Othercategories[index].name.toString()),
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
