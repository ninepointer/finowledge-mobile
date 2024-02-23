import 'package:stoxhero/src/app/app.dart';

class VerifySignupRequest {
  String? mobile;
  String? mobileOtp;
  String? studentName;
  String? parentsName;
  String? grade;
  String? school;
  String? city;
  String? dob;
  String? referrerCode;
  String? campaignCode;
  FcmTokenData? fcmTokenData;
  String? section;
  String? pin;

  VerifySignupRequest({
    this.mobile,
    this.mobileOtp,
    this.studentName,
    this.parentsName,
    this.grade,
    this.school,
    this.city,
    this.dob,
    this.referrerCode,
    this.campaignCode,
    this.fcmTokenData,
    this.section,
    this.pin,
  });

  VerifySignupRequest.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    parentsName = json['parents_name'];
    grade = json['grade'];
    school = json['school'];
    city = json['city'];
    dob = json['dob'];
    referrerCode = json['referrerCode'];
    campaignCode = json['campaignCode'];
    mobile = json["mobile"];
    mobileOtp = json['mobile_otp'];
    section = json['section'];
    pin = json['pin'];
    fcmTokenData = json['fcmTokenData'] != null
        ? new FcmTokenData.fromJson(json['fcmTokenData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_name'] = this.studentName;
    data['parents_name'] = this.parentsName;
    data['grade'] = this.grade;
    data['school'] = this.school;
    data['city'] = this.city;
    data['dob'] = this.dob;
    data['referrerCode'] = this.referrerCode;
    data['campaignCode'] = this.campaignCode;
    data["mobile"] = this.mobile;
    data['mobile_otp'] = this.mobileOtp;
    data['section'] = this.section;
    data['pin'] = this.pin;
    if (this.fcmTokenData != null) {
      data['fcmTokenData'] = this.fcmTokenData!.toJson();
    }
    return data;
  }
}
