// class DoctorModel {
//   dynamic page;
//   int totalPages;
//   int totalDoctors;
//   List<Body> body;
//
//   DoctorModel({
//     required this.page,
//     required this.totalPages,
//     required this.totalDoctors,
//     required this.body,
//   });
//
//   factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
//         page: json['page'],
//         totalPages: json['total_pages'],
//         totalDoctors: json['total_doctors'],
//         body: (json['body'])
//             .map((dynamic e) => Body.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['page'] = page;
//     json['total_pages'] = totalPages;
//     json['total_doctors'] = totalDoctors;
//     json['body'] = body.map((e) => e.toJson()).toList();
//     return json;
//   }
// }
//
// class Body {
//   dynamic id;
//   List<DoctorName> doctorName;
//   String doctorEmail;
//   String doctorGender;
//   List<DoctorSpecialization> doctorSpecialization;
//   String doctorLocation;
//   List<DoctorClinics> doctorClinics;
//   dynamic doctorRating;
//   String certificateImagePath;
//   String profileImagePath;
//   List<dynamic> clinicImagesPath;
//   String profileStatus;
//   dynamic fees;
//   List<dynamic> doctorPadges;
//   dynamic clinicWaitingTime;
//   dynamic voting;
//
//
//   Body({
//     required this.id,
//     required this.doctorName,
//     required this.doctorEmail,
//     required this.doctorGender,
//     required this.doctorSpecialization,
//     required this.doctorLocation,
//     required this.doctorClinics,
//     required this.doctorRating,
//     required this.certificateImagePath,
//     required this.profileImagePath,
//     required this.clinicImagesPath,
//     required this.profileStatus,
//     required this.fees,
//     required this.doctorPadges,
//     required this.clinicWaitingTime,
//     required this.voting,
//
//   });
//
//   factory Body.fromJson(Map<String, dynamic> json) => Body(
//         id: json['_id'],
//         doctorName: (json['doctorName'])
//             .map((dynamic e) => DoctorName.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         doctorEmail: json['doctorEmail'],
//         doctorGender: json['doctorGender'],
//         doctorSpecialization: (json['doctorSpecialization'])
//             .map((dynamic e) =>
//                 DoctorSpecialization.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         doctorLocation: json['doctorLocation'],
//         doctorClinics: (json['doctorClinics'])
//             .map((dynamic e) =>
//                 DoctorClinics.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         doctorRating: json['doctorRating'],
//         certificateImagePath: json['certificateImagePath'],
//         profileImagePath: json['profileImagePath'],
//         clinicImagesPath: (json['clinicImagesPath'])
//             .map((dynamic e) =>
//                 ClinicImagesPath.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         profileStatus: json['profileStatus'],
//         fees: json['fees'],
//         doctorPadges: (json['doctorPadges']).map((e) => e as String).toList(),
//         clinicWaitingTime: json['clinicWaitingTime'],
//         voting: json['voting'],
//
//       );
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['_id'] = id;
//     json['doctorName'] = doctorName.map((e) => e.toJson()).toList();
//     json['doctorEmail'] = doctorEmail;
//     json['doctorGender'] = doctorGender;
//     json['doctorSpecialization'] =
//         doctorSpecialization.map((e) => e.toJson()).toList();
//     json['doctorLocation'] = doctorLocation;
//     json['doctorClinics'] = doctorClinics.map((e) => e.toJson()).toList();
//     json['doctorRating'] = doctorRating;
//     json['certificateImagePath'] = certificateImagePath;
//     json['profileImagePath'] = profileImagePath;
//     json['clinicImagesPath'] = clinicImagesPath.map((e) => e.toJson()).toList();
//     json['profileStatus'] = profileStatus;
//     json['fees'] = fees;
//     json['doctorPadges'] = doctorPadges;
//     json['clinicWaitingTime'] = clinicWaitingTime;
//     json['voting'] = voting;
//
//     return json;
//   }
// }
//
// class DoctorName {
//   String arabicName;
//   String englishName;
//   DoctorName({required this.arabicName, required this.englishName});
//
//   factory DoctorName.fromJson(Map<String, dynamic> json) => DoctorName(
//         arabicName: json['arabicName'],
//         englishName: json['englishName'],
//       );
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['arabicName'] = arabicName;
//     return json;
//   }
// }
//
// class DoctorSpecialization {
//   dynamic specializationEnglish;
//   dynamic specializationArabic;
//   DoctorSpecialization(
//       {required this.specializationEnglish,
//       required this.specializationArabic});
//
//   factory DoctorSpecialization.fromJson(Map<String, dynamic> json) =>
//       DoctorSpecialization(
//           specializationEnglish: json['specialization_english'],
//           specializationArabic: json['specialization_arabic']);
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['specialization_english'] = specializationEnglish;
//     return json;
//   }
// }
//
// class DoctorClinics {
//   List<dynamic> clinicAppointment;
//   List<dynamic> place;
//
//   DoctorClinics({
//     required this.clinicAppointment,
//     required this.place,
//   });
//
//   factory DoctorClinics.fromJson(Map<String, dynamic> json) => DoctorClinics(
//         clinicAppointment: (json['clinicAppointment'])
//             .map((dynamic e) =>
//                 ClinicAppointment.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         place: (json['place'] as List)
//             .map((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['clinicAppointment'] =
//         clinicAppointment.map((e) => e.toJson()).toList();
//     json['place'] = place.map((e) => e.toJson()).toList();
//     return json;
//   }
// }
//
// class ClinicAppointment {
//   dynamic time1;
//   dynamic day1;
//   dynamic time2;
//   dynamic day2;
//   dynamic time3;
//   dynamic day3;
//   dynamic sectime1;
//   dynamic secday1;
//   dynamic sectime2;
//   dynamic secday2;
//   dynamic sectime3;
//   dynamic secday3;
//
//   ClinicAppointment(
//       {required this.time1,
//       required this.day1,
//       required this.day2,
//       required this.day3,
//       required this.time2,
//       required this.time3,
//       required this. sectime1  ,
//       required this.secday1,
//       required this.sectime2,
//       required this.secday2,
//       required this.sectime3,
//       required this.secday3,
//
//
//
//       });
//
//   factory ClinicAppointment.fromJson(Map<String, dynamic> json) =>
//       ClinicAppointment(
//           time1: json['time1'],
//           day1: json['day1'],
//           time2: json['time2'],
//           day2: json['day2'],
//           time3: json['time3'],
//           day3: json['day3'],
//           sectime1:  json['sectime1'] ,
//         secday1: json['secday1'],
//         sectime2: json['sectime2'],
//         secday2: json['secday2'],
//         sectime3: json['sectime3'],
//         secday3: json['secday3'],
//
//       );
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['time1'] = time1;
//     json['day1'] = day1;
//     return json;
//   }
// }
//
// class Place {
//   dynamic placeEnglish;
//   dynamic placeArabic;
//   dynamic clinicEnglishName;
//   dynamic clinicArabicName;
//   Place(
//       {required this.placeEnglish,
//       required this.placeArabic,
//       required this.clinicArabicName,
//       required this.clinicEnglishName});
//
//   factory Place.fromJson(Map<String, dynamic> json) => Place(
//       placeArabic: json['placeArabic'],
//       placeEnglish: json['placeEnglish'],
//       clinicEnglishName: json['clinicEnglishName'],
//       clinicArabicName: json['clinicArabicName']);
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['placeEnglish'] = placeEnglish;
//     json['placeArabic'] = placeArabic;
//     return json;
//   }
// }
//
// class ClinicImagesPath {
//   String image;
//
//   ClinicImagesPath({
//     required this.image,
//   });
//
//   factory ClinicImagesPath.fromJson(Map<String, dynamic> json) =>
//       ClinicImagesPath(
//         image: json['image'],
//       );
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['image'] = image;
//     return json;
//   }
// }
class DoctorModel {
  dynamic page;
  dynamic totalPages;
  dynamic totalDoctors;
  List<Body>? body;

  DoctorModel({
    this.page,
    this.totalPages,
    this.totalDoctors,
    this.body,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    page = json['page'] as dynamic;
    totalPages = json['total_pages'] as dynamic;
    totalDoctors = json['total_doctors'] as dynamic;
    body = (json['body'] as List?)?.map((dynamic e) => Body.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['page'] = page;
    json['total_pages'] = totalPages;
    json['total_doctors'] = totalDoctors;
    json['body'] = body?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Body {
  String? id;
  List<DoctorName>? doctorName;
  String? doctorEmail;
  String? doctorGender;
  List<DoctorSpecialization>? doctorSpecialization;
  String? doctorLocation;
  List<DoctorClinics>? doctorClinics;
  dynamic doctorRating;
  String? certificateImagePath;
  String? profileImagePath;
  List<ClinicImagesPath>? clinicImagesPath;
  String? profileStatus;
  String? fees;
  List<String>? doctorPadges;
  String? clinicWaitingTime;
  int? voting;
  String? entity;
  int? v;
  String? createdAt;
  String? updatedAt;

  Body({
    this.id,
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
    this.fees,
    this.doctorPadges,
    this.clinicWaitingTime,
    this.voting,
    this.entity,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  Body.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    doctorName = (json['doctorName'] as List?)?.map((dynamic e) => DoctorName.fromJson(e as Map<String,dynamic>)).toList();
    doctorEmail = json['doctorEmail'] as String?;
    doctorGender = json['doctorGender'] as String?;
    doctorSpecialization = (json['doctorSpecialization'] as List?)?.map((dynamic e) => DoctorSpecialization.fromJson(e as Map<String,dynamic>)).toList();
    doctorLocation = json['doctorLocation'] as String?;
    doctorClinics = (json['doctorClinics'] as List?)?.map((dynamic e) => DoctorClinics.fromJson(e as Map<String,dynamic>)).toList();
    doctorRating = json['doctorRating'] as dynamic;
    certificateImagePath = json['certificateImagePath'] as String?;
    profileImagePath = json['profileImagePath'] as String?;
    clinicImagesPath = (json['clinicImagesPath'] as List?)?.map((dynamic e) => ClinicImagesPath.fromJson(e as Map<String,dynamic>)).toList();
    profileStatus = json['profileStatus'] as String?;
    fees = json['fees'] as String?;
    doctorPadges = (json['doctorPadges'] as List?)?.map((dynamic e) => e as String).toList();
    clinicWaitingTime = json['clinicWaitingTime'] as String?;
    voting = json['voting'] as int?;
    entity = json['entity'] as String?;
    v = json['__v'] as int?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['doctorName'] = doctorName?.map((e) => e.toJson()).toList();
    json['doctorEmail'] = doctorEmail;
    json['doctorGender'] = doctorGender;
    json['doctorSpecialization'] = doctorSpecialization?.map((e) => e.toJson()).toList();
    json['doctorLocation'] = doctorLocation;
    json['doctorClinics'] = doctorClinics?.map((e) => e.toJson()).toList();
    json['doctorRating'] = doctorRating;
    json['certificateImagePath'] = certificateImagePath;
    json['profileImagePath'] = profileImagePath;
    json['clinicImagesPath'] = clinicImagesPath?.map((e) => e.toJson()).toList();
    json['profileStatus'] = profileStatus;
    json['fees'] = fees;
    json['doctorPadges'] = doctorPadges;
    json['clinicWaitingTime'] = clinicWaitingTime;
    json['voting'] = voting;
    json['entity'] = entity;
    json['__v'] = v;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    return json;
  }
}

class DoctorName {
  String? arabicName;
  String? englishName;
  DoctorName({
    this.arabicName,
    this.englishName
  });

  DoctorName.fromJson(Map<String, dynamic> json) {
    arabicName = json['arabicName'] as String?;
    englishName =  json['englishName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['arabicName'] = arabicName;
    return json;
  }
}

class DoctorSpecialization {
  String? specializationEnglish;

  DoctorSpecialization({
    this.specializationEnglish,
  });

  DoctorSpecialization.fromJson(Map<String, dynamic> json) {
    specializationEnglish = json['specialization_english'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['specialization_english'] = specializationEnglish;
    return json;
  }
}

class DoctorClinics {
  List<ClinicAppointment>? clinicAppointment;
  List<Place>? place;

  DoctorClinics({
    this.clinicAppointment,
    this.place,
  });

  DoctorClinics.fromJson(Map<String, dynamic> json) {
    clinicAppointment = (json['clinicAppointment'] as List?)?.map((dynamic e) => ClinicAppointment.fromJson(e as Map<String,dynamic>)).toList();
    place = (json['place'] as List?)?.map((dynamic e) => Place.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['clinicAppointment'] = clinicAppointment?.map((e) => e.toJson()).toList();
    json['place'] = place?.map((e) => e.toJson()).toList();
    return json;
  }
}

class ClinicAppointment {
  String? time1;
  String? day1;

  ClinicAppointment({
    this.time1,
    this.day1,
  });

  ClinicAppointment.fromJson(Map<String, dynamic> json) {
    time1 = json['time1'] as String?;
    day1 = json['day1'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['time1'] = time1;
    json['day1'] = day1;
    return json;
  }
}

class Place {
  String? placeEnglish;
  String? placeArabic;

  Place({
    this.placeEnglish,
    this.placeArabic,
  });

  Place.fromJson(Map<String, dynamic> json) {
    placeEnglish = json['placeEnglish'] as String?;
    placeArabic = json['placeArabic'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['placeEnglish'] = placeEnglish;
    json['placeArabic'] = placeArabic;
    return json;
  }
}

class ClinicImagesPath {
  String? image;

  ClinicImagesPath({
    this.image,
  });

  ClinicImagesPath.fromJson(Map<String, dynamic> json) {
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['image'] = image;
    return json;
  }
}