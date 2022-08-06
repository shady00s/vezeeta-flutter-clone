class DoctorModel {
  String? message;
  List<Body>? body;
  DoctorModel({this.body, this.message});
  DoctorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if(json['body']!=null){
      body = <Body>[];
      for (var element in (json['body'] as List)) {
        body!.add(Body.fromJson(element));
      }
    }


  }
}

class Body {
  String? id;
  String? doctorName;
  String? doctorEmail;
  String? doctorGender;
  String? doctorSpecialization;
  String? doctorLocation;
  List<DoctorClinics>? doctorClinics;
  int? doctorRating;
  String? certificateImagePath;
  String? profileImagePath;
  List<ClinicImagePath>? clinicImagesPath;
  String? profileStatus;
  String? createdAt;
  String? updatedAt;
  int? v;

  Body(
      {this.id,
      this.doctorName,
      this.doctorEmail,
      this.doctorGender,
      this.doctorSpecialization,
      this.doctorLocation,
      this.doctorClinics,
      this.doctorRating,
      this.certificateImagePath,
      this.profileImagePath,
      this.clinicImagesPath,
      this.profileStatus,
      this.createdAt,
      this.updatedAt,
      this.v});
  Body.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    doctorName = json['doctorName'];
    doctorEmail = json['doctorEmail'];
    doctorGender = json['doctorGender'];
    doctorSpecialization = json['doctorSpecialization'];
    doctorLocation = json['doctorLocation'];
    if (json['doctorClinics'] != null) {
      doctorClinics = <DoctorClinics>[];

      for (var element in (json['doctorClinics'] as List)) {
        doctorClinics!.add(DoctorClinics.fromJson(element));
      }
    }

    doctorRating = json['doctorRating'];
    certificateImagePath = json['certificateImagePath'];
    profileImagePath = json['profileImagePath'];

    if(json['clinicImagesPath']!=null){
        clinicImagesPath = <ClinicImagePath>[];
        for (var element in (json['clinicImagesPath'] as List)) {
          clinicImagesPath!.add(ClinicImagePath.fromJson(element));
        }
    }

    profileStatus = json['profileStatus'];
    profileStatus = json['profileStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}
class ClinicImagePath{
  String? image;
  ClinicImagePath({this.image});
  ClinicImagePath.fromJson(Map<String,dynamic> json){
    image = json['image'];
  }
}
class DoctorClinics {
  String? address;
  String? clinicName;

  DoctorClinics(this.address, this.clinicName);

  DoctorClinics.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    clinicName = json['clinicName'];
  }
}
