import 'package:flutter/material.dart';

class NoConnectivityScreen extends StatelessWidget {
  const NoConnectivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image:  AssetImage('assets/mainBackgroundIntro.png')) ,
      ),
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("No connection to the internet"),
          ElevatedButton(onPressed: (){}, child:const Text("refresh"))
        ],
      )
    );
  }
}
