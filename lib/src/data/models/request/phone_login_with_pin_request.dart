class PhoneLoginWithPinRequest {
  String? mobile;
  String? pin;

  PhoneLoginWithPinRequest({
    this.mobile,
    this.pin,
  });

  PhoneLoginWithPinRequest.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['pin'] = this.pin;
    return data;
  }
}
