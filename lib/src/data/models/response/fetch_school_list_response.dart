class FetchSchoolResponse {
  String? sId;
  String? schoolName;
  String? city;
  String? schoolString;

  FetchSchoolResponse(
      {this.sId, this.schoolName, this.city, this.schoolString});

  FetchSchoolResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    schoolName = json['school_name'];
    city = json['city'];
    schoolString = json['schoolString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['school_name'] = this.schoolName;
    data['city'] = this.city;
    data['schoolString'] = this.schoolString;
    return data;
  }

  firstWhere(bool Function(dynamic school) param0,
      {required FetchSchoolResponse Function() orElse}) {}
}
