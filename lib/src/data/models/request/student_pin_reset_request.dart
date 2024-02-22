import 'dart:math';

import 'package:stoxhero/src/app/app.dart';

class StudentPinResetRequest {
  String? mobile;
  String? mobileOtp;
  String? pin;
  String? confirmPin;

  StudentPinResetRequest(
      {this.mobile, this.mobileOtp, this.pin, this.confirmPin});

  StudentPinResetRequest.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    mobileOtp = json['resetPinOtp'];
    pin = json['pin'];
    confirmPin = json['confirm_pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['resetPinOtp'] = this.mobileOtp;
    data['pin'] = this.pin;
    data['confirm_pin'] = this.confirmPin;

    return data;
  }
}
