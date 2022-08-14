
import 'dart:math';

import 'package:dio/dio.dart';

import '../model/doctorModel.dart';

class DoctorController {
  Stream<List<Body>> doctorDataResult(int page) async* {
    print("opining stream");

    try{
      List<Body> result = [];
      Response<dynamic> data = await  DioController().getDoctors("/user-doctor-search", page);
      print(data.statusMessage);
      print(data.statusCode);
      DoctorModel doctorList = DoctorModel.fromJson(data.data);
      for (var element in doctorList.body!) {  result.add(element);}
      yield result;
    }catch(e){print(e);}

  }

  Stream <Body> getDoctorData( String doctorID) async*{
    print("opining doctor profile stream");
    try{
    late  Body result ;
      Response<dynamic>  data =  await DioController().getDoctorById( doctorID);
      print(data.statusMessage);
      print(data.statusCode);
      Body doctorList = Body.fromJson(data.data["body"]);
    result = doctorList;
      yield result;
    }catch(e){
      print(e);
    }

  }
}
class DioController{

  Dio dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:4500",
        receiveDataWhenStatusError: true
  ));

  Future<Response>getDoctors(String url,int page) async{
    print("opining dio");

    return  await  dio.get(url, queryParameters: {"page":page});
  }

  Future<Response>getDoctorById(String doctorID) async{
    print("opining doctor profile dio");

    return  await  dio.get('/user-doctor-profile/$doctorID', );
  }
}
