import 'package:flutter/material.dart';
import 'package:vezeeta_clone/presentation/view/pages/main-page/subPages/editProfileScreen.dart';

import '../../../../data/controller/userController.dart';
import '../../../../data/model/userModel.dart';
import '../../reusable_screens/loginSolotionsScreen.dart';
import '../../reusable_screens/splash_screen.dart';
import '../../reuseable_widgets/settingsCard.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<UserBody>(
      future: UserController().userProfileData(),
      builder: (BuildContext context, AsyncSnapshot<UserBody>snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.none:

          case ConnectionState.waiting:
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            showDialog(context: context, builder: (context)=>const SplashScreen());
          });
          return const Text('') ;
          case ConnectionState.active:

          case ConnectionState.done:
            if(snapshot.hasData){
              Navigator.pop(context);
              return  Column(
                children: [
                  // name and phone number
                  DecoratedBox(decoration: const BoxDecoration(color: Colors.white),

                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height:  80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text("Welcome to vezeeta! ${snapshot.data!.userName}"),
                          Text("+20 ${snapshot.data!.phoneNumber}")
                        ],
                      ),
                    )
                    ,)
                  ,   const SizedBox(height: 5,),

                  // user data
                  DecoratedBox(decoration: const BoxDecoration(color: Colors.white),

                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          SettingsCard(icon:Icons.account_circle_outlined, title: ' My Account', targetWidget: EditProfileScreen(phoneNumber: snapshot.data!.phoneNumber!, userEmail:snapshot.data!.userEmail!, userName: snapshot.data!.userName!,),)
                          , const  Divider(),
                          const   SettingsCard(icon:Icons.heart_broken, title: ' Favorites',) ,
                          const  Divider(),
                          const  SettingsCard(icon:Icons.stars_rounded, title: ' Vezeeta Points')
                        ],
                      ),
                    )
                    ,)
                  ,   const SizedBox(height: 5,),
                  // user settings
                  DecoratedBox(decoration: const BoxDecoration(color: Colors.white),

                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SettingsCard(icon:Icons.headset_mic_outlined, title: ' Support', )
                          ,Divider(),
                          SettingsCard(icon:Icons.settings, title: ' Settings')

                        ],
                      ),
                    )
                    ,)
                  ,   const SizedBox(height: 5,),

                  // logout and rate
                  DecoratedBox(decoration: const BoxDecoration(color: Colors.white),

                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SettingsCard( isGray: true, icon:Icons.star_outline_rounded, title: ' Rate the app')
                          ,Divider(),
                          SettingsCard(isGray: true, icon:Icons.logout_rounded, title: ' Logout',)

                        ],
                      ),
                    )
                    ,)
                  ,   const SizedBox(height: 5,),
                  Text("Version 1.11",style: TextStyle(color: Colors.grey,fontSize: 14),)

                ],
              );
            }

            else{
              WidgetsBinding.instance.addPostFrameCallback((_){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginSolutionScreen()));

              });
              return Text('');
            }
        }
      },
    );
  }
}
