// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  DoctorModel({
    this.page,
    this.totalPages,
    this.totalDoctors,
    this.body,
  });

  final String? page;
  final int? totalPages;
  final int? totalDoctors;
  final List<Body>? body;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    page: json["page"] == null ? null : json["page"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    totalDoctors: json["total_doctors"] == null ? null : json["total_doctors"],
    body: json["body"] == null ? null : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "total_pages": totalPages == null ? null : totalPages,
    "total_doctors": totalDoctors == null ? null : totalDoctors,
    "body": body == null ? null : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class Body {
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
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final List<DoctorName>? doctorName;
  final String? doctorEmail;
  final DoctorGender? doctorGender;
  final List<DoctorSpecialization>? doctorSpecialization;
  final DoctorLocation? doctorLocation;
  final List<DoctorClinic>? doctorClinics;
  final double? doctorRating;
  final String? certificateImagePath;
  final String? profileImagePath;
  final List<ClinicImagesPath>? clinicImagesPath;
  final ProfileStatus? profileStatus;
  final String? fees;
  final List<DoctorPadge>? doctorPadges;
  final String? clinicWaitingTime;
  final int? voting;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["_id"] == null ? null : json["_id"],
    doctorName: json["doctorName"] == null ? null : List<DoctorName>.from(json["doctorName"].map((x) => DoctorName.fromJson(x))),
    doctorEmail: json["doctorEmail"] == null ? null : json["doctorEmail"],
    doctorGender: json["doctorGender"] == null ? null : doctorGenderValues.map[json["doctorGender"]],
    doctorSpecialization: json["doctorSpecialization"] == null ? null : List<DoctorSpecialization>.from(json["doctorSpecialization"].map((x) => DoctorSpecialization.fromJson(x))),
    doctorLocation: json["doctorLocation"] == null ? null : doctorLocationValues.map[json["doctorLocation"]],
    doctorClinics: json["doctorClinics"] == null ? null : List<DoctorClinic>.from(json["doctorClinics"].map((x) => DoctorClinic.fromJson(x))),
    doctorRating: json["doctorRating"] == null ? null : json["doctorRating"].toDouble(),
    certificateImagePath: json["certificateImagePath"] == null ? null : json["certificateImagePath"],
    profileImagePath: json["profileImagePath"] == null ? null : json["profileImagePath"],
    clinicImagesPath: json["clinicImagesPath"] == null ? null : List<ClinicImagesPath>.from(json["clinicImagesPath"].map((x) => ClinicImagesPath.fromJson(x))),
    profileStatus: json["profileStatus"] == null ? null : profileStatusValues.map[json["profileStatus"]],
    fees: json["fees"] == null ? null : json["fees"],
    doctorPadges: json["doctorPadges"] == null ? null : List<DoctorPadge>.from(json["doctorPadges"].map((x) => doctorPadgeValues.map[x])),
    clinicWaitingTime: json["clinicWaitingTime"] == null ? null : json["clinicWaitingTime"],
    voting: json["voting"] == null ? null : json["voting"],
    v: json["__v"] == null ? null : json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "doctorName": doctorName == null ? null : List<dynamic>.from(doctorName!.map((x) => x.toJson())),
    "doctorEmail": doctorEmail == null ? null : doctorEmail,
    "doctorGender": doctorGender == null ? null : doctorGenderValues.reverse![doctorGender],
    "doctorSpecialization": doctorSpecialization == null ? null : List<dynamic>.from(doctorSpecialization!.map((x) => x.toJson())),
    "doctorLocation": doctorLocation == null ? null : doctorLocationValues.reverse![doctorLocation],
    "doctorClinics": doctorClinics == null ? null : List<dynamic>.from(doctorClinics!.map((x) => x.toJson())),
    "doctorRating": doctorRating == null ? null : doctorRating,
    "certificateImagePath": certificateImagePath == null ? null : certificateImagePath,
    "profileImagePath": profileImagePath == null ? null : profileImagePath,
    "clinicImagesPath": clinicImagesPath == null ? null : List<dynamic>.from(clinicImagesPath!.map((x) => x.toJson())),
    "profileStatus": profileStatus == null ? null : profileStatusValues.reverse![profileStatus],
    "fees": fees == null ? null : fees,
    "doctorPadges": doctorPadges == null ? null : List<dynamic>.from(doctorPadges!.map((x) => doctorPadgeValues.reverse![x])),
    "clinicWaitingTime": clinicWaitingTime == null ? null : clinicWaitingTime,
    "voting": voting == null ? null : voting,
    "__v": v == null ? null : v,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}

class ClinicImagesPath {
  ClinicImagesPath({
    this.image,
  });

  final String? image;

  factory ClinicImagesPath.fromJson(Map<String, dynamic> json) => ClinicImagesPath(
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image == null ? null : image,
  };
}

class DoctorClinic {
  DoctorClinic({
    this.clinicAppointment,
    this.place,
  });

  final List<ClinicAppointment>? clinicAppointment;
  final List<Place> ?place;

  factory DoctorClinic.fromJson(Map<String, dynamic> json) => DoctorClinic(
    clinicAppointment: json["clinicAppointment"] == null ? null : List<ClinicAppointment>.from(json["clinicAppointment"].map((x) => ClinicAppointment.fromJson(x))),
    place: json["place"] == null ? null : List<Place>.from(json["place"].map((x) => Place.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "clinicAppointment": clinicAppointment == null ? null : List<dynamic>.from(clinicAppointment!.map((x) => x.toJson())),
    "place": place == null ? null : List<dynamic>.from(place!.map((x) => x.toJson())),
  };
}

class ClinicAppointment {
  ClinicAppointment({
    this.time1,
    this.day1,
    this.time2,
    this.day2,
    this.time3,
    this.day3,
    this.sectime1,
    this.secday1,
    this.sectime2,
    this.secday2,
    this.sectime3,
    this.secday3,
  });

  final String? time1;
  final String ?day1;
  final String? time2;
  final String? day2;
  final String? time3;
  final String? day3;
  final String? sectime1;
  final String? secday1;
  final String? sectime2;
  final String? secday2;
  final String? sectime3;
  final String? secday3;

  factory ClinicAppointment.fromJson(Map<String, dynamic> json) => ClinicAppointment(
    time1: json["time1"] == null ? null : json["time1"],
    day1: json["day1"] == null ? null : json["day1"],
    time2: json["time2"] == null ? null : json["time2"],
    day2: json["day2"] == null ? null : json["day2"],
    time3: json["time3"] == null ? null : json["time3"],
    day3: json["day3"] == null ? null : json["day3"],
    sectime1: json["sectime1"] == null ? null : json["sectime1"],
    secday1: json["secday1"] == null ? null : json["secday1"],
    sectime2: json["sectime2"] == null ? null : json["sectime2"],
    secday2: json["secday2"] == null ? null : json["secday2"],
    sectime3: json["sectime3"] == null ? null : json["sectime3"],
    secday3: json["secday3"] == null ? null : json["secday3"],
  );

  Map<String, dynamic> toJson() => {
    "time1": time1 == null ? null : time1,
    "day1": day1 == null ? null : day1,
    "time2": time2 == null ? null : time2,
    "day2": day2 == null ? null : day2,
    "time3": time3 == null ? null : time3,
    "day3": day3 == null ? null : day3,
    "sectime1": sectime1 == null ? null : sectime1,
    "secday1": secday1 == null ? null : secday1,
    "sectime2": sectime2 == null ? null : sectime2,
    "secday2": secday2 == null ? null : secday2,
    "sectime3": sectime3 == null ? null : sectime3,
    "secday3": secday3 == null ? null : secday3,
  };
}

class Place {
  Place({
    this.placeEnglish,
    this.placeArabic,
    this.clinicEnglishName,
    this.clinicArabicName,
  });

  final String? placeEnglish;
  final String? placeArabic;
  final String? clinicEnglishName;
  final String? clinicArabicName;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    placeEnglish: json["placeEnglish"] == null ? null : json["placeEnglish"],
    placeArabic: json["placeArabic"] == null ? null : json["placeArabic"],
    clinicEnglishName: json["clinicEnglishName"] == null ? null : json["clinicEnglishName"],
    clinicArabicName: json["clinicArabicName"] == null ? null : json["clinicArabicName"],
  );

  Map<String, dynamic> toJson() => {
    "placeEnglish": placeEnglish == null ? null : placeEnglish,
    "placeArabic": placeArabic == null ? null : placeArabic,
    "clinicEnglishName": clinicEnglishName == null ? null : clinicEnglishName,
    "clinicArabicName": clinicArabicName == null ? null : clinicArabicName,
  };
}

enum DoctorGender { MALE, FEMALE }

final doctorGenderValues = EnumValues({
  "female": DoctorGender.FEMALE,
  "male": DoctorGender.MALE
});

enum DoctorLocation { BENI_SUEF }

final doctorLocationValues = EnumValues({
  "Beni Suef": DoctorLocation.BENI_SUEF
});

class DoctorName {
  DoctorName({
    this.arabicName,
    this.englishName,
  });

  final String? arabicName;
  final String? englishName;

  factory DoctorName.fromJson(Map<String, dynamic> json) => DoctorName(
    arabicName: json["arabicName"] == null ? null : json["arabicName"],
    englishName: json["englishName"] == null ? null : json["englishName"],
  );

  Map<String, dynamic> toJson() => {
    "arabicName": arabicName == null ? null : arabicName,
    "englishName": englishName == null ? null : englishName,
  };
}

enum DoctorPadge { HYGIENE, FRIENDLY, GOOD_LISTENER, INFORMATIVE }

final doctorPadgeValues = EnumValues({
  "friendly": DoctorPadge.FRIENDLY,
  "good listener": DoctorPadge.GOOD_LISTENER,
  "Hygiene": DoctorPadge.HYGIENE,
  "informative": DoctorPadge.INFORMATIVE
});

class DoctorSpecialization {
  DoctorSpecialization({
    this.specializationEnglish,
    this.specializationArabic,
  });

  final String? specializationEnglish;
  final String? specializationArabic;

  factory DoctorSpecialization.fromJson(Map<String, dynamic> json) => DoctorSpecialization(
    specializationEnglish: json["specialization_english"] == null ? null : json["specialization_english"],
    specializationArabic: json["specialization_arabic"] == null ? null : json["specialization_arabic"],
  );

  Map<String, dynamic> toJson() => {
    "specialization_english": specializationEnglish == null ? null : specializationEnglish,
    "specialization_arabic": specializationArabic == null ? null : specializationArabic,
  };
}

enum ProfileStatus { ACCEPTED }

final profileStatusValues = EnumValues({
  "accepted": ProfileStatus.ACCEPTED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);


  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
