import 'package:flutter/material.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/subPages/doctorCategoriesPage.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/SearchByNameScreen.dart';

import '../../managers/colorsManager.dart';
import '../../managers/textStyleManager.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool opened = false;
  animation(){
    Future.delayed(const Duration(milliseconds: 100)).then((value) => setState(() {
      opened = true;
    }));

  }

  @override
  void initState() {
   animation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opened? 1 : 0,
      duration: const Duration(milliseconds: 100),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Image(image: AssetImage("assets/logo.png"),width: 120,),
              )
              ,
              SizedBox(height: 20,),
              // page routing buttons
              SizedBox(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 0,
                        child: InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorCategoriesPage()));
                          },
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/background.png"),
                              width: 40,
                            ),
                            Text("Clinic visit")
                          ],
                        ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/background2.png"),
                              width: 40,
                            ),
                            Text("Pharmacy")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/background3.png"),
                              width: 40,
                            ),
                            Text("Doctor call")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/background4.png"),
                              width: 40,
                            ),
                            Text("Home Visit")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/background5.png"),
                              width: 40,
                            ),
                            Text("Procedures")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/background6.png"),
                              width: 40,
                            ),
                            Text("lab Tests")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // book clinic appointment widget ( leads to search page )
              Card(
                elevation: 0,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchByNameScreen()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Book clinic appointment",
                          style: TextStyling.titleStyleText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  Text(
                                    "search for speciality,doctor,or hospital",
                                    style: TextStyling.subTitleStyleText,
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // insurance widget
              SizedBox(
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // icon
                        Image(
                          image: AssetImage("assets/background7.png"),
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My insurance",
                              style: TextStyling.titleStyleText,
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                                width: 240,
                                child: Text(
                                  "Book a doctor or buy medicine with insurance",
                                  style: TextStyling.subTitleStyleText,
                                )),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // advertising container
              SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Card(
                    color: Color.fromRGBO(41, 136, 218, 1),
                    child: Row(
                      children: [
                        // text
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Hit your daily steps target and win 10 EGP everyday.',
                                    style: TextStyle(color: Colors.white,),
                                  ),
                                ),
                                MaterialButton(
                                  color: Colors.white,

                                  onPressed: () {},
                                  child: Text('Get Started'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Image(
                                image: AssetImage("assets/background8.png"),
                              ),
                            ))
                      ],
                    ),
                  )),
              SizedBox(height: 20,),
              // book clinic appointment widget ( leads to search page )
              Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Order medicines",
                        style: TextStyling.titleStyleText,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Text(
                                "What are u looking for?",
                                style: TextStyling.subTitleStyleText,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 80,
                            child: Card(
                              elevation: 0,
                              color:ColorManager.lightBlueBackgroundColor,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.language_rounded,color: Color.fromRGBO(52, 81, 205, 1.0)),
                                    Text("Prescription or Claim" ,style: TextStyle(color: Color.fromRGBO(52, 81, 205, 1.0)),textAlign: TextAlign.center,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 80,
                            child: Card(
                              elevation: 0,
                              color:ColorManager.lightBlueBackgroundColor,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Icon(Icons.camera_enhance_outlined ,color:  ColorManager.lightBlueTextColor),
                                  Text("Product Picture",style: TextStyle(color:  ColorManager.lightBlueTextColor),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 80,
                            child: Card(
                              elevation: 0,
                              color:ColorManager.lightBlueBackgroundColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Icon(Icons.call,color: ColorManager.lightBlueTextColor),
                                  Text("Pharmacist Assistance",textAlign: TextAlign.center,style: TextStyle(color:  ColorManager.lightBlueTextColor),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // home visit container
              Card(
                elevation: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text("Home visit",style: TextStyling.titleStyleText,),
                        SizedBox(
                         width: 180,
                           child: Text("choose the sepcialty, and the doctor willl visit you at home",style: TextStyling.subTitleStyleText,),
                ),
                          SizedBox(
                            width: 180,
                            child: MaterialButton(
                              elevation: 0,
                              color: Color.fromRGBO(171, 213, 248, 0.4392156862745098),
                              onPressed: () {},
                              child: Text('Book visit',style:TextStyle(color:  ColorManager.lightBlueTextColor) ,),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Image(image: AssetImage("assets/background9.png"),width: 125,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // Doctor call container
              Card(
                elevation: 0,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Doctor Call",style: TextStyling.titleStyleText,),
                          SizedBox(
                            width: 180,
                            child: Text(
                            "Schedule a voice or vedio call with a specialized doctor.",style: TextStyling.subTitleStyleText,),
                          ),
                          SizedBox(
                            width: 190,
                            child: MaterialButton(
                                elevation: 0,
                                color: Color.fromRGBO(171, 213, 248, 0.4392156862745098),
                                onPressed: () {},
                                child: Text('Call Doctor',style:TextStyle(color:  ColorManager.lightBlueTextColor,),
                                )) ,
                          )

                        ],
                      ),
                    ),
                      Image(image: AssetImage("assets/background10.png"),width: 125,)

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
