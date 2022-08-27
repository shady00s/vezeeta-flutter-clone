
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

String herokuURL = 'https://vezeeta-data-api.herokuapp.com';

class DioController {
  Dio dio =
      Dio(BaseOptions(baseUrl: herokuURL, receiveDataWhenStatusError: true));


  Dio dio2 = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:3000', receiveDataWhenStatusError: true));

  Future<Response> getDoctors(String url, int page,
      String doctorSpecializationEnglish, doctorLocation ,filter) async {

 if(filter== null || filter == {}) {
   return await dio.get(url, queryParameters: {
     "page": page,
     "doctorSpecializationEnglish": doctorSpecializationEnglish,
     "doctorLocation": doctorLocation,

   }
   );
 } else {

   return await dio.get(url, queryParameters: {
     "page": page,
     "doctorSpecializationEnglish": doctorSpecializationEnglish,
     "doctorLocation": doctorLocation,
     "doctorGender":filter['doctorGender'],
     "doctorEntity":filter['doctorEntity'],
     "doctorSorting":filter["doctorSorting"]
   }
   );

 }
  }

  Future<Response> getDoctorById(String doctorID) async {

    Response data = await dio.get(
      '/user-doctor-profile/$doctorID',
    );
    return data;
  }

  Future<Response> userLogIn(String email, password) async {
    Response data = await dio
        .post('/user-login', data: {"userEmail": email, "userPassword": password});
    print(data);
    return data;
  }

  Future<Response> addUserAppointment(
      String doctorID, Map<String,dynamic> appointmentDetails) async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('user-token') ?? '';
      String userID = prefs.getString('userID')??'';
      print(userID);
      dio.options.contentType = 'application/json; charset=UTF-8';

      dio.options.headers = {
        'Accept': 'application/json',
        'User-Token': token
      };
      Response clientData = await dio.post('/user-add-appointment/$userID',data:{"data":{"userAppointments":appointmentDetails['userAppointments'],"doctorData":appointmentDetails['doctorData']}} ,);
      return clientData;


  }

  Future<Response> removeUserAppointment(
      String doctorID, Map<String,dynamic> appointmentDetails) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user-token') ?? '';
    String userID = prefs.getString('userID')??'';
    print(userID);
    dio2.options.contentType = 'application/json; charset=UTF-8';

    dio2.options.headers = {
      'Accept': 'application/json',
      'User-Token': token
    };
    Response clientData = await dio2.post('/user-remove-appointment/$userID',data:{"data":{"userAppointments":appointmentDetails['userAppointments'],"doctorData":appointmentDetails['doctorData']}} ,);
    return clientData;


  }
  
  Future<Response> getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user-token') ?? '';
    String userID = prefs.getString('userID')??'';

    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'User-Token': token
    };

    Response clientData = await dio.get('/user-profile/$userID');

      print("Data from profile" );
    return clientData;
  }


  Future<Response> searchByName(String doctorName)async{
     Response data = await dio.get('/user-doctor-search' ,queryParameters: {"doctorNameEnglish":doctorName});
     return data;

  }

  Future<Response> userReg(Object userData) async{

    Response data = await dio.post('/user-register',data: userData);
    return data;
  }

  Future<Response>userProfile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user-token') ?? '';
    String userID = prefs.getString('userID')??'';

    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'user-token': token
    };
    Response data = await dio.get('/user-profile/$userID');
    return data;
  }
  
  Future<Response>userEditProfile(Object editData )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user-token') ?? '';
    String userID = prefs.getString('userID')??'';
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'user-token': token
    };
      print(token) ;
      print(userID) ;

      Response data = await dio.post('/user-edit-profile/$userID',data: editData);

      return data;




    
  }

}
