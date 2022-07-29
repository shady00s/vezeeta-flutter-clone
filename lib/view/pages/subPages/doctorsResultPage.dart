import 'package:flutter/material.dart';
import 'package:vezeeta_clone/view/pages/subPages/selectCityPage.dart';
import 'package:vezeeta_clone/view/reuseable_widgets/textForm.dart';

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
                padding: const EdgeInsets.only(top: 35.0,left: 5,right: 45),
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
                              color: Color.fromRGBO(33, 22, 179, 0.7137254901960784),

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
          )



          // search
          ,TextFormWidget(),
          //filter buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            margin: EdgeInsets.all(12),
            elevation: 0,
            color: ColorManager.lightBlueBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment:MainAxisAlignment.center,
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
                      Text("Save up to 50% of you medical bills.",style: TextStyle(color:  ColorManager.lightBlueTextColor),)
                    ],
                  ),
                  ElevatedButton(onPressed: (){}, child: Text("Upgrade",))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
