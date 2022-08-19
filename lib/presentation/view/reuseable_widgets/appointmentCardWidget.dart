import 'package:flutter/material.dart';

import '../managers/colorsManager.dart';
import '../managers/textStyleManager.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({Key? key ,required this.appointmentList}) : super(key: key);
  final List appointmentList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // right button
          SizedBox(
            width: 30,
            height: 30,
            child:      DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(3),
                  border:  Border.all(color:  const Color.fromRGBO(186, 189, 189, 0.5058823529411764))
              ),
              child:        Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: IconButton( onPressed: (){}, icon: const Icon(Icons.arrow_back_ios,size: 15,color: ColorManager.lightBlueTextColor,) ,padding: EdgeInsets.zero, )) ,
            )
          ),
          AppointmentElement(),
          AppointmentElement(),
          AppointmentElement(),
          // left button
          SizedBox(
              width: 30,
              height: 30,
              child:      DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(3),
                    border:  Border.all(color:  const Color.fromRGBO(186, 189, 189, 0.5058823529411764))
                ),
                child:        Padding(
                    padding: const EdgeInsets.only(left:4.0),
                    child: IconButton( onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,size: 15,color: ColorManager.lightBlueTextColor,) ,padding: EdgeInsets.zero, )) ,
              )
          )
          ]),
    );
  }
}

class AppointmentElement extends StatelessWidget {
  const AppointmentElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  130,
      width:  MediaQuery.of(context).size.width / 4.55,
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)
        , border:  Border.all(color: const Color.fromRGBO(186, 189, 189, 0.5058823529411764) )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            // first bar
            
            const Expanded(
              flex: 1,
              child: DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(9) ,topRight: Radius.circular(9)),color: Color.fromRGBO(
                  29, 72, 211, 1.0))
              ,child:  Center(child: Text("Today",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
              ),
            ),
            Expanded(flex: 3, child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("09:00pm" ,style: TextStyling.subTitleStyleText,),
              Text("To",style: TextStyling.subTitleStyleText,),
              Text("09:00pm",style: TextStyling.subTitleStyleText,),
            ],)),

            const Expanded(
              flex: 1,
              child: DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(9) ,bottomLeft: Radius.circular(9)),color: Color.fromRGBO(
                  232, 29, 29, 1.0))

                ,child:  Center(child: Text("Book",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
              ),
            ),
          ]
          ,
        ),
      ),
    );
  }
}

class AppointmentCreator extends StatefulWidget{
  const AppointmentCreator({Key? key}) : super(key: key);

  @override
  State<AppointmentCreator> createState() => _AppointmentCreatorState();
}

class _AppointmentCreatorState extends State<AppointmentCreator> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}