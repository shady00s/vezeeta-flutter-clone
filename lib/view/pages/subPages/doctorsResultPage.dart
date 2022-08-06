import 'package:flutter/material.dart';
import 'package:vezeeta_clone/controller/doctorController.dart';
import 'package:vezeeta_clone/model/doctorModel.dart';
import 'package:vezeeta_clone/view/pages/subPages/selectCityPage.dart';
import 'package:vezeeta_clone/view/reuseable_widgets/doctorCardWidget.dart';
import 'package:vezeeta_clone/view/reuseable_widgets/textFormWidget.dart';

import '../../styles/colors.dart';

class DocotorsListPage extends StatefulWidget {
  const DocotorsListPage({Key? key,required this.cityName}) : super(key: key);
  final String cityName;
  @override
  State<DocotorsListPage> createState() => _DocotorsListPageState();
}

class _DocotorsListPageState extends State<DocotorsListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: [
          // customized app bar
            DecoratedBox(decoration: BoxDecoration(color: ColorManager.appBarColor)
             ,child: SizedBox(
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 5,right: 45),
                child: Row(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: ()=>Navigator.pop(context),),
                    Spacer(),

                    InkWell(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Searching in",style: TextStyle(fontSize: 11,color: Colors.white),),
                          SizedBox(height: 8,),
                          SizedBox(
                            child: Card(
                              margin: EdgeInsets.zero,
                              elevation: 0,
                              color: Color.fromRGBO(3, 94, 179, 0.7137254901960784),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(widget.cityName,style: TextStyle(fontSize: 12,color: Colors.white),),
                                    Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                      ,onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCityPage())),
                    )
                    ,Spacer()
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            elevation: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              // search
              TextFormWidget(),
              //filter buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                    children:[
                      Expanded(child: OutlinedButton(style: OutlinedButton.styleFrom(elevation: 0 ), onPressed: (){}, child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [Icon(Icons.sort),Text("Sort")],),)),
                      SizedBox(width: 10,),
                      Expanded(child: OutlinedButton(style:OutlinedButton.styleFrom(elevation: 0 ,),onPressed: (){}, child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [Icon(Icons.filter_alt_outlined),Text("Filter")]))),
                      SizedBox(width: 10,),
                      Expanded(child: OutlinedButton(style: OutlinedButton.styleFrom(elevation: 0 ,),onPressed: (){}, child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [Icon(Icons.location_on_rounded),Text("Map")]))),
                    ]

                ),
              ),
              // premium adv

              Card(
                margin: EdgeInsets.symmetric(horizontal: 12 ,vertical: 10),
                elevation: 0,
                color: ColorManager.lightBlueBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/logo.png"),width: 80,),
                              SizedBox(width:10 ),
                              Card(
                                color: Colors.red,
                                margin: EdgeInsets.only(top: 6),

                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text("Care",style: TextStyle(color: Colors.white),),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text("Save up to 50% of you medical bills.",style: TextStyle(color:  ColorManager.lightBlueTextColor),)
                        ],
                      ),
                      ElevatedButton( style: ElevatedButton.styleFrom(primary: Color.fromRGBO(2, 112, 204, 1)), onPressed: (){}, child: Text("Upgrade",))
                    ],
                  ),
                ),
              ),
            ],),),

          Expanded(child:
           StreamBuilder<DoctorModel> (
            stream: DoctorController().getDoctorsByLocationAndSpecialization(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          DoctorModel doctors = snapshot.data;

                if(snapshot.hasData ) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.active:
                      return const Center(child: CircularProgressIndicator(),);
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator(),);

                    case ConnectionState.done:
                      return ListView.builder(
                          itemCount: doctors.body!.length,
                          itemBuilder: (context, index) =>
                              DoctorCardWidget(doctorData: doctors.body![index],));
                  }
                }
                else{
                  return const Center(child: CircularProgressIndicator(),);
                }
            })
    )
        ],
      ),
    );
  }
}
