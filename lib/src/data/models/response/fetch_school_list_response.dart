class FetchSchoolResponse {
  String? status;
  List<FetchSchoolList>? data;

  FetchSchoolResponse({this.status, this.data});

  FetchSchoolResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FetchSchoolList>[];
      json['data'].forEach((v) {
        data!.add(new FetchSchoolList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FetchSchoolList {
  String? sId;
  String? schoolName;
  String? address;
  FetchCity? city;
  String? state;
  String? schoolString;

  FetchSchoolList(
      {this.sId,
      this.schoolName,
      this.address,
      this.city,
      this.state,
      this.schoolString});

  FetchSchoolList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    schoolName = json['school_name'];
    address = json['address'];
    city = json['city'] != null ? new FetchCity.fromJson(json['city']) : null;
    state = json['state'];
    schoolString = json['schoolString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['school_name'] = this.schoolName;
    data['address'] = this.address;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['state'] = this.state;
    data['schoolString'] = this.schoolString;
    return data;
  }
}

class FetchCity {
  String? sId;
  String? name;

  FetchCity({this.sId, this.name});

  FetchCity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
