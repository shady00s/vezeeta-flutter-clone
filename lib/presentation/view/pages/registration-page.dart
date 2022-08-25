import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';
import 'package:vezeeta_clone/presentation/view/managers/colorsManager.dart';
import 'package:vezeeta_clone/presentation/view/pages/login-page.dart';

import '../../../data/controller/userController.dart';
import '../managers/textStyleManager.dart';
import '../reuseable_widgets/submitButton.dart';
import '../reuseable_widgets/textFormWidget.dart';
import 'main-page/main-page.dart';


enum ClientGender { male , female}
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  GlobalKey _key =  GlobalKey();

  // controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController   confirmPassword = TextEditingController();

ClientGender  _gender = ClientGender.male;

// image pickers
  Future<XFile> imagesFromGallery() async{
    final XFile? image = await  ImagePicker().pickImage(source: ImageSource.gallery);
    return image!;
  }

  Future<XFile> imageFromCamera() async{
    final XFile? image = await  ImagePicker().pickImage(source: ImageSource.camera);
    return image!;
  }

  // image
  String ImagePath = '';
  late File image  = File(ImagePath);
  late  XFile  img = XFile(ImagePath);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height:900,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                key: _key,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // name
                  const Text(
                    "Enter your Name:",
                    style: TextStyling.titleStyleText,
                    textAlign: TextAlign.start,
                  ),
                  TextFormWidget(
                      hintText: 'Full name:',
                      prefixIcon: Icons.edit,
                      controller: nameController,
                      inputType: TextInputType.emailAddress),

                  // email
                  const Text(
                    "Enter your email:",
                    style: TextStyling.titleStyleText,
                    textAlign: TextAlign.start,
                  ),
                  TextFormWidget(
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      controller: emailController,
                      inputType: TextInputType.emailAddress),

                  // password
                  const Text(
                    "Enter your password:",
                    style: TextStyling.titleStyleText,
                    textAlign: TextAlign.start,
                  ),
                  TextFormWidget(
                    hintText: 'Password:',
                    prefixIcon: Icons.password,
                    controller: passwordController,
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),

                  // confirm password
                  const Text(
                    "Enter your password:",
                    style: TextStyling.titleStyleText,
                    textAlign: TextAlign.start,
                  ),
                  TextFormWidget(
                    hintText: 'Type your password again:',
                    prefixIcon: Icons.password,
                    controller: confirmPassword,
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),


                  //gender
                  const Text(
                    "Gender:",
                    style: TextStyling.titleStyleText,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    key: Key('value1'),
                    children: [
                      // male


                      SizedBox(
                        width: 120,
                        height:  50,
                        child: Row(
                          key: Key('value2'),

                          children: [
                            Radio<ClientGender>(
                              value: ClientGender.male,
                              groupValue: _gender,
                              onChanged: ((ClientGender? value){
                                setState(() {
                                  _gender = value!;
                                });
                              }),
                            ),
                            const Text(
                              "Male",

                              textAlign: TextAlign.start,
                            ),


                          ],
                        ),
                      ),
                    // female


                      SizedBox(
                        width: 120,
                        height:  50,
                        child: Row(
                          key: Key('value3'),
                          children: [
                        Radio<ClientGender>(
                        value: ClientGender.female,
                          groupValue: _gender,
                          onChanged: ((ClientGender? value){
                            setState(() {
                              _gender = value!;
                            });
                          }),

                        ),
                            const Text(
                              "Female",

                              textAlign: TextAlign.start,
                            ),

                          ],
                        ),
                      )
                    ],
                  ),

                  // user image 
                  const Text(
                    "Profile Image:",
                    style: TextStyling.titleStyleText,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    child:  Row(
                      children: [
                        SizedBox(
                          child: Column(children: [
                            ImagePath != '' ?
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  child: Image.memory(image.readAsBytesSync(),width: 80,)),
                            ):
                            // no Image widget
                            Card(
                              elevation:0,
                              color: Color.fromRGBO(
                                  155, 147, 147, 0.25882352941176473),
                              child:
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.no_photography_outlined),
                                    Text("No Image")
                                  ],
                                ),
                              ),
                            ),
                          ],),
                        ),
                        // imageButtons
                        const Spacer(),

                        TextButton.icon(onPressed: (){
                          imageFromCamera().then((value) => setState((){
                            ImagePath = value.path;
                            img = value;
                          }));
                        },style: ButtonStyle(foregroundColor:MaterialStateProperty.resolveWith((state)=> Colors.black)), icon: Icon(Icons.camera_alt_outlined ,color: ColorManager.lightBlueTextColor,), label: Text("From Camera"),)
                        ,TextButton.icon(onPressed: (){
                          imagesFromGallery().then((value) => setState((){
                            ImagePath = value.path;
                            img = value;
                          }));
                        },style: ButtonStyle(foregroundColor:MaterialStateProperty.resolveWith((state)=> Colors.black)), icon: Icon(Icons.image_outlined ,color: ColorManager.lightBlueTextColor,), label: Text("From Gallery"),)
                      ],
                    ),
                  ),
                  // submit button
                  SubmitButtonWidget(buttonText: "Register",onSubmit: (){
                    print(image);

                    MultipartFile.fromFile(ImagePath).then((value) =>

                        UserController()
                            .userRegister(
                            FormData.fromMap({
                              "userName":nameController.text,
                              "userEmail":emailController.text,
                              "userPassword":passwordController.text,
                              "userAge":"21",
                              "userProfileImagePath":value

                            })
                        )
                            .then((value2) {
                          if (value2 == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MainPage()));
                          }
                          else{
                            AlertDialog(content: Text("there is an error with registration"),);
                          }
                        }

                        )

                    );




                  }),
                  SizedBox(

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> const LoginScreen()));
                        },
                        child: RichText(text:

                        const TextSpan(text: "Already have account?  " ,
                            style: TextStyle(color: Colors.grey),
                            children: [TextSpan(text: "Log in",style:  TextStyle(color:Colors.blue))]
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
