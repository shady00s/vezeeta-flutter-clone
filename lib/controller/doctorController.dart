
import 'package:dio/dio.dart';

import '../model/doctorModel.dart';

class DoctorController {
  Stream<List<dynamic>> doctorDataResult(int page) async* {
    print("opining stream");
    List<dynamic> result = [];
    await DioController().getDoctors("/user-doctor-search", page).then((value) {
      value.data["body"].forEach((e) => result.add(e));
    });

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
}
