class FetchSchoolRequest {
  String? inputString;
  String? stateName;

  FetchSchoolRequest({this.inputString, this.stateName});

  FetchSchoolRequest.fromJson(Map<String, dynamic> json) {
    inputString = json['inputString'];
    stateName = json['stateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['inputString'] = this.inputString;
    data['stateName'] = this.stateName;
    return data;
  }
}
