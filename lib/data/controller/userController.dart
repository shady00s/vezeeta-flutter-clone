import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/data/controller/dioController.dart';
import 'package:vezeeta_clone/data/model/doctorModel.dart';
import 'package:vezeeta_clone/data/model/userModel.dart';

class UserController {

  Future <bool>userLogin(String email, password) async {
    Response data = await DioController().userLogIn(email, password);
    UserBody userData =  UserBody.fromJson(data.data['body']);
    if (data.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('user-token', data.headers.value('user-token')!);
      prefs.setString('userID', userData.id!);
      prefs.setString('userName', userData.userName!);
      prefs.setString('phoneNumber',userData.phoneNumber!);
        return true;
    }
    else{
      return false;
    }
  }

  Future <bool>userAddAppointment(String doctorID, Map<String,dynamic> appointmentData) async {

    Response data = await DioController().addUserAppointment(doctorID,appointmentData);

    if (data.statusCode == 200) {

      return true;
    }
    else if(data.statusCode == 401){

      return false;
    }
    else{
      return false;
    }
  }

Future<dynamic>showUserAppointments() async {
    Response data = await DioController().getUserData();
    UserBody result = UserBody.fromJson(data.data['body']);
        List<Body> doctors = [];
    for (var element in result.userAppointments!)  {
      Response  doctorData =   await DioController().getDoctorById(element.doctorID!);
      Body docData = Body.fromJson(doctorData.data['body']);
      doctors.add(docData);
    }

      return {'userData':result, "doctorData":doctors};


  }

  Future<dynamic>removeUserAppointments(String doctorID, Map<String,dynamic> appointmentData) async {

    Response data = await DioController().removeUserAppointment(doctorID,appointmentData);

    if (data.statusCode == 200) {

      return true;
    }
    else if(data.statusCode == 401){

      return false;
    }
    else{
      return false;
    }
  }

  Future <List <Body>> searchByName(String doctorName) async{
    Response data =await   DioController().searchByName(doctorName);
       DoctorModel  result = DoctorModel.fromJson(data.data) ;

       return  result.body!;
  }


Future<bool> userRegister(Object userData) async{
    Response data  = await DioController().userReg( userData);

    if(data.statusCode == 201){
     UserBody userData =  UserBody.fromJson(data.data['body']);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('userID', userData.id!);
        prefs.setString('user-token', data.headers.value('user-token')!);
     prefs.setString('userName', userData.userName!);
     prefs.setString('phoneNumber', userData.phoneNumber!);
      return true;
    }
    else{
      return false;
    }
}

Future<UserBody> userProfileData() async{
    Response data = await DioController().userProfile();

    UserBody userData = UserBody.fromJson(data.data['body']);

    return userData;
}
}