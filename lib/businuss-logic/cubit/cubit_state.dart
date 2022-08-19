import 'package:flutter/material.dart';
@immutable
abstract class CubitState{}


class CubitInitial extends CubitState{}
// check if there is internet connection

class InternetConnectivityCheck extends CubitState{
    final bool isConnected;
    InternetConnectivityCheck({required this.isConnected});
}