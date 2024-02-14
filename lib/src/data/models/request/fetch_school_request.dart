class FetchSchoolRequest {
  String? inputString;
  String? stateName;
  String? cityName;

  FetchSchoolRequest({this.inputString, this.stateName,this.cityName});

  FetchSchoolRequest.fromJson(Map<String, dynamic> json) {
    inputString = json['inputString'];
    stateName = json['stateName'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['inputString'] = this.inputString;
    data['stateName'] = this.stateName;
    data['cityName'] = this.cityName;
    return data;
  }
}
