import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';

import '../managers/colorsManager.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard( {Key? key,required this.title , required this.icon, this.targetWidget, this.isGray}  ) : super(key: key);
  final bool? isGray;
  final String title;
  final IconData icon;
  final Widget? targetWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: (){
         targetWidget !=null ? Navigator.push(context, MaterialPageRoute(builder: (context)=> targetWidget!))
         : showDialog(context: context, builder: (context){
           return AlertDialog(
             content:Text('Do you want to log-out?') ,
             actions: [
               TextButton(onPressed: () {
                  SharedPreferences.getInstance().then((value) {
                    value.remove('userID');
                    value.remove('user-token');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                 });

               }, child: Text('Log out')),
               TextButton(onPressed: () {
                 Navigator.pop(context);

               }, child: Text('Cancel'))
             ],
           );
         })
         ;
        },
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Row(
            children:  [
                Icon( icon ,color:  isGray == true  ?   Colors.grey : ColorManager.lightBlueTextColor),
                 const SizedBox(width: 10,),
                Text(title),
              const  Spacer(),
              const   Icon(Icons.arrow_forward_ios_rounded ,color: Colors.grey ,size: 15,),
            ],
          ),
        ),
      ),
    );
  }
}



