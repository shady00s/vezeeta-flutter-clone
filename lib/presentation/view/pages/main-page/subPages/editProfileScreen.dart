import 'package:flutter/material.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),

        title: Text("Edit Profile",style: TextStyle(fontSize: 21)),
      leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back,)  ,color: Colors.black,),
      ),
    );
  }
}
