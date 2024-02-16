class FetchSchoolRequest {
  String? inputString;
  String? cityId;

  FetchSchoolRequest({this.inputString, this.cityId});

  FetchSchoolRequest.fromJson(Map<String, dynamic> json) {
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
