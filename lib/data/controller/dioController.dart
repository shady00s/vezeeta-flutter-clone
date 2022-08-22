import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/presentation/view/pages/doctorAppointmentRegistration.dart';

String herokuURL = 'https://vezeeta-data-api.herokuapp.com';

class DioController {
  Dio dio =
      Dio(BaseOptions(baseUrl: herokuURL, receiveDataWhenStatusError: true));

  Dio dio2 = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:3000', receiveDataWhenStatusError: true));

  Future<Response> getDoctors(String url, int page,
      String doctorSpecializationEnglish, doctorLocation) async {
    print("opining dio");

    return await dio2.get(url, queryParameters: {
      "page": page,
      "doctorSpecializationEnglish": doctorSpecializationEnglish,
      "doctorLocation": doctorLocation
    });
  }

  Future<Response> getDoctorById(String doctorID) async {
    print("opining doctor profile dio");
    Response data = await dio2.get(
      '/user-doctor-profile/$doctorID',
    );
    return data;
  }

  Future<Response> userLogIn(String email, password) async {
    Response data = await dio2
        .post('/user-login', data: {"userEmail": email, "userPassword": password});
    return data;
  }

  Future<Response> userAppointment(
      String doctorID, Data appointmentDetails) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user-token') ?? '';

    dio2.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'user-token': token
    };

    Response clientData = await dio2.post('/user-add-appointemt/$doctorID',
        data: {
          "userAppointments": {
            "doctorID": appointmentDetails.doctorID,
            "appointmentHour": appointmentDetails.appointmentHour,
            "appointmentDay": appointmentDetails.appointmentDay,
          },
          "doctorData": {
            "clientName": appointmentDetails.clientName,
            "clientPhoneNumber": appointmentDetails.clientPhoneNumber
          }
        },
        cancelToken: CancelToken());



    return clientData;
  }
  
  Future<Response> getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user-token') ?? '';
    String userID = prefs.getString('userID')??'';
    dio2.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'user-token': token
    };

    Response clientData = await dio2.get('/user-profile/$userID');


    return clientData;
  }
}
