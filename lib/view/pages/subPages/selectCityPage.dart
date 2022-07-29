import 'package:flutter/material.dart';
import 'package:vezeeta_clone/view/styles/colors.dart';

import 'doctorsResultPage.dart';

class _Cities{
 late String cityName;
 late String value;
 _Cities(this.cityName,this.value);
}
List<_Cities> _citiesList=[
    _Cities("All Cities","cairo"),
    _Cities("Cairo","cairo"),
    _Cities("Giza","cairo"),
    _Cities("Alexandria","cairo"),
    _Cities("North Coast","cairo"),
    _Cities("Qalyubia","cairo"),
    _Cities("Gharbia","cairo"),
    _Cities("Menofia","cairo"),
    _Cities("Fayoum","cairo"),
    _Cities("El-Dakahlia","cairo"),
    _Cities("El-Sharqia","cairo"),
    _Cities("El-Beheira","cairo"),
    _Cities("Matrouh","cairo"),
    _Cities("Assuit","cairo"),
    _Cities("El-Ismailia","cairo"),
    _Cities("Hurghada","cairo"),
    _Cities("Sharm El-Sheikh","cairo"),
    _Cities("Portsaid","cairo"),
    _Cities("Suez","cairo"),
    _Cities("Sohag","cairo"),
    _Cities("El-Minia","cairo"),
    _Cities("Kafr El sheikh","cairo"),
    _Cities("Luxor","cairo"),
    _Cities("Qena","cairo"),
    _Cities("Aswan","cairo"),
    _Cities("Beni Suef","cairo")

];

class SelectCityPage extends StatelessWidget {
  const SelectCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.appBarColor,
        title: Text("Select page"),
      ),
      body: ListView.builder(
          itemCount: _citiesList.length,
          shrinkWrap: true,
         itemBuilder: (context,index){
           return DecoratedBox(
             decoration: const BoxDecoration(
               border: Border(
                 bottom: BorderSide(color: Color.fromRGBO(
                   107, 111, 111, 0.30980392156862746),width: 1)
               )
             ),
             child: SizedBox(
               height: 60,
               child:
               InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> DocotorsListPage(cityName:_citiesList[index].cityName)
                   ));
                 },
                 child:
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
                       child: Align(
                           alignment: AlignmentDirectional.centerStart,
                           child: Text(_citiesList[index].cityName)),
                     ),


               ),
             ),
           );
         }),
    );
  }
}
