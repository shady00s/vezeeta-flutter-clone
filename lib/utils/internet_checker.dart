

import 'package:internet_connection_checker/internet_connection_checker.dart';

bool internetChecker() {
  late bool isConnected;

  InternetConnectionChecker().hasConnection.then((value) => isConnected = value );
 // InternetConnectionChecker().onStatusChange.listen((event) {
 //    switch (event){
 //      case InternetConnectionStatus.connected:
 //         isConnected = true;
 //         break;
 //      case InternetConnectionStatus.disconnected:
 //        isConnected = false;
 //        break;
 //
 //      default:
 //        print("there is an error");
  return isConnected;
}