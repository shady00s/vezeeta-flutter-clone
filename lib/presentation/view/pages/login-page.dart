import 'package:flutter/material.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/main-page.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/submitButton.dart';
import 'package:vezeeta_clone/presentation/view/reuseable_widgets/textFormWidget.dart';

import '../../../data/controller/userController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
             SubmitButtonWidget(onSubmit: (){
               UserController()
                   .userLogin(emailController.text,
                   passwordController.text)
                   .then((value) {
                 if (value == true) {
                   setState(() {
                     isLoading = false;
                   });
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                           const MainPage()));
                 }
               });

             }, buttonText: "Log in")
            ],
          ),
        ));
  }
}
