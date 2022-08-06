
import 'package:dio/dio.dart';

import '../model/doctorModel.dart';

class DoctorController{
  late bool isLoading ;
  final Dio _dio = Dio();
  Stream <DoctorModel> getDoctorsByLocationAndSpecialization() async*{


    try {

      var values = await _dio.get('http://10.0.2.2:4500/doctors',queryParameters: {
            "specialization": "cardiology",
            "location": "cairo"
          });

      DoctorModel doc = DoctorModel.fromJson(values.data);

      print(doc);
      yield doc;
    }catch(e)
    {
      print(e);
    }

  }

Stream<DoctorModel> getDoctorInformation(String? doctorID) async*{
      DoctorModel doctorDetails ;
      final String _path = 'http://10.0.2.2:4500/doctors';

        var result =  await _dio.get(_path+doctorID!,);

        doctorDetails = result.data;

        print(doctorDetails);
        yield doctorDetails;

      }


}

