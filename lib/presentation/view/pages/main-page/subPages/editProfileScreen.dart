import 'package:flutter/material.dart';
import 'package:vezeeta_clone/data/controller/userController.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/profile-page.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/submitButton.dart';

import 'package:vezeeta_clone/presentation/view/reuseable_widgets/textFormWidget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key,required this.userName,required this.userEmail,required this.phoneNumber}) : super(key: key);
    final String userName;
    final String userEmail;
    final String phoneNumber;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  void initState() {
    setState(() {
      userNameController.text = widget.userName;
      userEmailController.text = widget.userEmail;
      phoneNumberController.text = widget.phoneNumber;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),

        title:const Text("Edit Profile",style:  TextStyle(fontSize: 21)),
      leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back,)  ,color: Colors.black,),
        actions: [
          TextButton(onPressed: (){
            UserController().userEdit({
              "userName":userNameController.text,
              "userEmail":userEmailController.text,
              "phoneNumber":phoneNumberController.text
            }).then((value) {if(value == true){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
            }
            else{
              showDialog(context: context, builder: (context){
              return  AlertDialog(content: Text("There is an error"),);
              });
            }
            });
          }, child: const Text('Save'))
        ],
    )
     , body: DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
       child: SizedBox(

         child:Column(
           children: [
             TextFormWidget(hintText: "User Name:", prefixIcon: Icons.account_circle_outlined, controller: userNameController, inputType: TextInputType.text),
             TextFormWidget(hintText: "User Email:", prefixIcon: Icons.account_circle_outlined, controller: userEmailController, inputType: TextInputType.text),
             TextFormWidget(hintText: "User Phone Number:", prefixIcon: Icons.account_circle_outlined, controller: phoneNumberController, inputType: TextInputType.text),

           ],
         ),
       ),
     )



    );
  }
}
