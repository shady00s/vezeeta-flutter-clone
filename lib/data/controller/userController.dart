import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/data/controller/dioController.dart';
import 'package:vezeeta_clone/presentation/view/pages/doctorAppointmentRegistration.dart';

class UserController {

  Future <bool>userLogin(String email, password) async {
    Response data = await DioController().userLogIn(email, password);

    if (data.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('user-token', data.headers.value('user-token')!);

        return true;
    }
    else{
      return false;
    }
  }

  Future <bool>userAddAppointment(BuildContext context,String doctorID, Data appointmentData) async {
    print(appointmentData);
    Response data = await DioController().userAppointment(doctorID,appointmentData);

    if (data.statusCode == 200) {
      print(data.data);
      return true;
    }
    else{
      return false;
    }
  }

  Future <bool>showUserAppointments() async {

    Response data = await DioController().userAppointment(doctorID,appointmentData);

    if (data.statusCode == 200) {
      print(data.data);
      return true;
    }
    else{
      return false;
    }
  }

}