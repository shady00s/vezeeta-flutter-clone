class UserModel{
    String? message;
   UserBody? userBody;
  UserModel({this.userBody,this.message});
  UserModel.fromJson(Map <String,dynamic> json){
    message = json['message'] as String?;
    userBody = json['body'] as UserBody?;
  }
}



class UserBody {
  String? id;
   String? userName;
   String? userEmail;
   String? userPassword;
   String? userAge;
   String? userProfileImagePath;
   List<UserAppointments>? userAppointments;
   List<String>? userAgeDesiease;
   List <UserLapAppointment>? userLapAppointment;
   int? v;
    String? phoneNumber;
  UserBody({this.userName,this.userAge,this.userAgeDesiease,this.userAppointments,this.userEmail,this.userLapAppointment,this.userPassword,this.userProfileImagePath,this.v});

  UserBody.fromJson(Map<String , dynamic> json){
      id = json['_id'] as String;
      userName = json["userName"] as String;
      userEmail = json["userEmail"] as String;
      userPassword = json["userPassword"] as String;
      userAge = json["userAge"] as String;
      userProfileImagePath = json["userProfileImagePath"] as String;
      userAppointments = (json["userAppointments"] as List?)?.map((e) => UserAppointments.fromJson(e)).toList();
      userAgeDesiease = (json["userAgeDesiease"] as List?)?.map((e) => e as String).toList();
      userLapAppointment =  (json["userLapAppointment"] as List?)?.map((e) => UserLapAppointment.fromJson(e)).toList();
      v = json['_v' ] as int?;
      phoneNumber = json['phoneNumber'] as String ?;
    }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id']= id;
    json['userName']= userName;
    json['userEmail'] =userEmail;
    json['userPassword'] =userPassword;
    json['userAge'] =userAge;
    json['userProfileImagePath'] =userProfileImagePath;
    json['userAgeDesiease'] =userAgeDesiease;
    json['userLapAppointment'] =userLapAppointment;
    json['_v'] =v;
    return json;
  }

}

class UserAppointments {
    String? doctorID;
    String ? appointmentHour;
    String ? appointmentDay;

    UserAppointments.fromJson(Map<String,dynamic> json){
      doctorID = json["doctorID"] as String;
      appointmentHour = json["appointmentHour"] as String;
      appointmentDay = json["appointmentDay"] as String;

    }
}

class UserLapAppointment{
  String? lapType;
  String? lapDate;
  UserLapAppointment.fromJson(Map<String, dynamic> json){
    lapType= json['lapType'];
    lapDate = json['lapDate'];
  }

}