import 'package:dio/dio.dart';

import '../model/doctorModel.dart';
import 'dioController.dart';

class DoctorController {
  Stream<List<Body>> doctorDataResult(int page , Future<String> doctorSpecializationEnglish,String doctorLocation) async* {
    print("opining stream");
    String doc = await doctorSpecializationEnglish;
    try {
      List<Body> result = [];
      Response<dynamic> data =
          await DioController().getDoctors("/user-doctor-search", page , doc ,doctorLocation);
      print(data.statusMessage);
      print(data.statusCode);

      DoctorModel doctorList = DoctorModel.fromJson(data.data);
      for (var element in doctorList.body!) {
        result.add(element);
      }
      yield result;
    } catch (e) {
      print(e);
    }
  }

  Stream<Body> getDoctorData(String doctorID) async* {
    print("opining doctor profile stream");
    try {
      late Body result;
      Response<dynamic> data = await DioController().getDoctorById(doctorID);
      print(data.statusMessage);
      print(data.statusCode);
      Body doctorList = Body.fromJson(data.data["body"]);
      result = doctorList;
      yield result;
    } catch (e) {
      print(e);
    }
  }
}


