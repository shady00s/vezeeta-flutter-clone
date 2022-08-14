
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

  Stream<dynamic> getDoctorData( String doctorID) async*{
    dynamic result;
    await DioController().getDoctorById("/user-doctor-profile/", doctorID).then((value) {
      print(value.data);
      result =  value.data ;
    });

    print(result);
    yield result;
  }
}


//   Stream<List<Body>>  doctorWithModel () async*{
//     print("opining stream with model");
//     List<Body> result = [];
//     await DioController().getDoctors("/user-doctor-search").then((value) {
//       value.data["body"].forEach((e)=> result.add(e));
//
//     });
//     print(result);
//     yield result;
//   }
// }

class DioController{

  Dio dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:4500",
        receiveDataWhenStatusError: true
  ));

  Future<Response>getDoctors(String url,int page) async{
    print("opining dio");

    return  await  dio.get(url, queryParameters: {"page":page});
  }

  Future<Response>getDoctorById(String url,String doctorID) async{
    print("opining dio");

    return  await  dio.get(url + '/user-doctor-profile/'+ doctorID, );
  }
}
