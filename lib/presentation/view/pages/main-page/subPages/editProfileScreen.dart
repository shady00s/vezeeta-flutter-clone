import 'package:flutter/material.dart';

import 'package:vezeeta_clone/presentation/view/reuseable_widgets/textFormWidget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),

        title:const Text("Edit Profile",style:  TextStyle(fontSize: 21)),
      leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back,)  ,color: Colors.black,),
    )
     , body: DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
       child: SizedBox(

         child:Column(
           children: [
             TextFormWidget(hintText: "User Name:", prefixIcon: Icons.account_circle_outlined, controller: TextEditingController(), inputType: TextInputType.text)
           ],
         ),
       ),
     )



    );
  }
}
