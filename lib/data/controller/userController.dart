import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/data/controller/dioController.dart';
import 'package:vezeeta_clone/data/model/doctorModel.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';
import 'package:vezeeta_clone/presentation/view/pages/doctorAppointmentRegistration.dart';

class UserController {

  Future <bool>userLogin(String email, password) async {
    Response data = await DioController().userLogIn(email, password);

    if (data.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('user-token', data.headers.value('user-token')!);
      prefs.setString('userID', data.data['body']['_id']!);
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

Stream<dynamic>showUserAppointments() async* {

    Response data = await DioController().getUserData();

        UserBody result  = UserBody.fromJson(data.data['body']);

        List<Body> doctors = [];
    for (var element in result.userAppointments!)  {

      Response  doctorData =   await DioController().getDoctorById(element.doctorID!);
      Body docData = Body.fromJson(doctorData.data['body']);

      doctors.add(docData);
    }





      yield {'userData':result, "doctorData":doctors};


  }

  Future <List <Body>> searchByName(String doctorName) async{
    Response data =await   DioController().searchByName(doctorName);
       DoctorModel  result = DoctorModel.fromJson(data.data) ;
      print(result);
       return  result.body!;
  }


Future<bool> userRegister(Object userData) async{
    Response data  = await DioController().userReg( userData);
    print(data.statusCode);
    if(data.statusCode == 201){
     UserBody userData =  UserBody.fromJson(data.data['body']);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('userID', userData.id!);
        prefs.setString('token', data.headers.value('user-token')!);
      return true;
    }
    else{
      return false;
    }
}
}