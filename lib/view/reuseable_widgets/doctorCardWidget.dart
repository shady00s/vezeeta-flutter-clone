import 'package:flutter/material.dart';
import 'package:vezeeta_clone/model/doctorModel.dart';

import '../managers/colorsManager.dart';
import '../pages/main-page/subPages/doctorProfilePage.dart';
import '../reusable_screens/ratingWidget.dart';

class DoctorCardWidget extends StatefulWidget {
  const DoctorCardWidget({Key? key ,required this.doctorData}) : super(key: key);
  final  Body doctorData;

  @override
  State<DoctorCardWidget> createState() => _DoctorCardWidgetState();
}

class _DoctorCardWidgetState extends State<DoctorCardWidget> {
  @override
  Widget build(BuildContext context) {


    return
      SizedBox(
        child: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorProfilePage(id: widget.doctorData.id) ));},
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Column(
                    children: [
                      DecoratedBox(decoration:const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 20.0,left: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               CircleAvatar(
                                radius: 40,
                                foregroundImage: NetworkImage( widget.doctorData.profileImagePath!),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(text: TextSpan(text: "Doctor ",
                                        style:  const TextStyle(color: ColorManager.lightBlueTextColor),
                                        children: [TextSpan( text:  widget.doctorData.doctorName![1].englishName ,style:const TextStyle(color: ColorManager.lightBlueTextColor,fontWeight: FontWeight.w600,fontSize: 18))])),

                                    SizedBox(width: MediaQuery.of(context).size.width*0.6,child: Text( '',style: const TextStyle(overflow: TextOverflow.ellipsis),),),

                                    //stars

                                    // rating widget
                                    RatingWidget(ratingValue: widget.doctorData.doctorRating),
                                    const SizedBox(height: 10,),
                                    Text("Overall Rating from  ${widget.doctorData.voting}  visitors"),
                                    const SizedBox(height: 15,),
                                  ]
                                  ,),
                              )
                            ],
                          ),
                        ) ,),
                    ],
                  ),
                  Positioned(
                    bottom:5 ,
                    left: 19,
                    child: DecoratedBox(decoration: BoxDecoration(
                        color: Colors.white
                        ,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black26,width: 1))

                      ,child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 9.0),
                        child: Row(children: [
                          const  Icon(Icons.account_circle_outlined),
                          const   SizedBox(width: 6,),
                          Text(widget.doctorData.doctorPadges![0])
                        ],),
                      ),),
                  ),
                ],
              ),
              DecoratedBox(decoration:const BoxDecoration(color: Colors.white),child: SizedBox(
                height: 240,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                        Image(image: AssetImage('assets/doctor/background-doc-1.png'),width: 25,),
                        const SizedBox(width: 20,),
                        Expanded(child: Text(widget.doctorData.doctorSpecialization![0].specializationEnglish!,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black54 , fontWeight: FontWeight.w500),))

                      ],),
                      Row(children: [
                        Image(image: AssetImage('assets/doctor/background-doc-2.png'),width: 25,),

                        const SizedBox(width: 20,),
                        Expanded(child: Text(widget.doctorData.doctorLocation!,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black54 , fontWeight: FontWeight.w500),))

                      ],),
                      Row(children: [
                        Image(image: AssetImage('assets/doctor/background-doc-3.png'),width: 25,),
                        const  SizedBox(width: 20,),
                        Text(" ${widget.doctorData.fees }  EGP"   ,style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.w500),)

                      ],),
                      Row(children: [
                        Image(image: AssetImage('assets/doctor/background-doc-4.png'),width: 25,),
                        const SizedBox(width: 20,),
                        Text("Waiting Time: ${widget.doctorData.clinicWaitingTime} Minuites",style: TextStyle(color: ColorManager.lightBlueTextColor,fontWeight: FontWeight.w500,),)

                      ],),

                      // date and book submit
                      const SizedBox(height: 10,),
                      Row(children: [

                        Expanded(child:DecoratedBox(decoration:const BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Available Today 0:400 PM",textAlign: TextAlign.center,),
                        ),)
                        ),
                        const SizedBox(width: 10,),
                        ElevatedButton(style: ElevatedButton.styleFrom(primary:Colors.red), onPressed: (){}, child:const Text("Book"))

                        ,
                      ],)
                    ],
                  ),
                ),
              ) ,)

            ],
          ),
        ),
      )
      ;
  }
}


class DoctorCardMini extends StatefulWidget{
  const DoctorCardMini({Key? key,required this.doctor }) :super(key: key);
  final dynamic doctor;

  @override
  State<DoctorCardMini> createState() => _DoctorCardMiniState();
}

class _DoctorCardMiniState extends State<DoctorCardMini> {
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        DecoratedBox(decoration: const BoxDecoration(color: Colors.white),child: Stack(
          fit: StackFit.loose,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 20.0,left: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        foregroundImage: AssetImage("assets/background2.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan(text: "Doctor ",
                                style: TextStyle(color: ColorManager.lightBlueTextColor),
                                children: [TextSpan(text:'',style: TextStyle(color: ColorManager.lightBlueTextColor,fontWeight: FontWeight.w600,fontSize: 18))])),
                            SizedBox(height: 20,),
                            SizedBox(child: Text("Dermatology,Cosmetology and laser asdad",style: TextStyle(overflow: TextOverflow.ellipsis),),width: MediaQuery.of(context).size.width*0.6,)
                            ,SizedBox(height: 10,),
                            //stars
                            Row(
                              children: [
                                Icon(Icons.star ,color: Colors.amber,size: 20,),
                                Icon(Icons.star,color: Colors.amber,size: 20,),
                                Icon(Icons.star,color: Colors.amber,size: 20,),
                                Icon(Icons.star,color: Colors.amber,size: 20,),
                                Icon(Icons.star,color: Colors.amber,size: 20,),
                              ],),
                            SizedBox(height: 10,),
                            Text("Overall Rating from 167 visitors"),
                            SizedBox(height: 15,),
                          ]
                          ,),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom:5 ,
              left: 19,
              child: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.white
                  ,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black26,width: 1))

                ,child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 9.0),
                  child: Row(children: [
                    Icon(Icons.account_circle_outlined),
                    SizedBox(width: 6,),
                    Text("Good listener"),

                  ],),
                ),),
            ),
          ],
        ),)


      ],
    )

     ;
  }
}