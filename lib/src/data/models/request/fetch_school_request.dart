class fetchSchoolRequest {
  String? inputString;
  String? cityId;

  fetchSchoolRequest({this.inputString, this.cityId});

  fetchSchoolRequest.fromJson(Map<String, dynamic> json) {
    inputString = json['inputString'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['inputString'] = this.inputString;

    data['cityId'] = this.cityId;
    return data;
  }
}
