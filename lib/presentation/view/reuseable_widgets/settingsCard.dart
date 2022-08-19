import 'package:flutter/material.dart';

import '../managers/colorsManager.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard( {Key? key,required this.title , required this.icon,required this.targetWidget, this.isGray}  ) : super(key: key);
  final bool? isGray;
  final String title;
  final IconData icon;
  final Widget targetWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> targetWidget));
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



