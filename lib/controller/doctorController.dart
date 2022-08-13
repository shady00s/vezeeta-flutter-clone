
import 'package:dio/dio.dart';

import '../model/doctorModel.dart';

class DoctorController{
  Stream<List<dynamic>  >  doctorDataResult () async*{
    print("opining stream");
    List<dynamic> result = [];
     await DioController().getDoctors("/user-doctor-search").then((value) {
       value.data["body"].forEach((e)=> result.add(e));

     });


  yield result;
  }
}

class DioController{

  Dio dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:4500",
        receiveDataWhenStatusError: true
  ));

  Future<Response>getDoctors(String url) async{
    print("opining dio");

    return  await  dio.get(url);
  }
}
