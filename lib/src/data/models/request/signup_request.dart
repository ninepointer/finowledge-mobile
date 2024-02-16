class SignupRequest {
  String? studentName;
  String? parentName;
  String? mobile;
  String? grade;
  String? dob;
  String? city;
  String? school;
  String? state;
  String? section;
  // String? state;
  // String? country;
  // String? referrerCode;
  // String? campaignCode;
  // String? pincode;

  SignupRequest({
    this.studentName = "",
    this.parentName = "",
    this.mobile = "",
    this.dob = "",
    this.city = "",
    this.grade = "",
    this.school = '',
    this.state = "",
    this.section = "",
    // this.state = "",
    // this.country = "",
    // this.referrerCode = "",
    // this.campaignCode = "",
    // this.pincode = "",
  });

  SignupRequest.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    parentName = json['parents_name'];
    mobile = json['mobile'];
    dob = json['dob'];
    grade = json["grade"];
    city = json['city'];
    school = json['school'];
    state = json['state'];
    section = json['section'];
    // state = json['state'];
    // country = json['country'];
    // referrerCode = json['referrerCode'];
    // campaignCode = json['campaignCode'];
    // pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_name'] = this.studentName;
    data['parents_name'] = this.parentName;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['city'] = this.city;
    data['grade'] = this.grade;
    data['school'] = this.school;
    data['state'] = this.state;
    data['section'] = this.section;
    // data['state'] = this.state;
    // data['country'] = this.country;
    // data['referrerCode'] = this.referrerCode;
    // data['campaignCode'] = this.campaignCode;
    // data['pincode'] = this.pincode;
    return data;
  }
}
