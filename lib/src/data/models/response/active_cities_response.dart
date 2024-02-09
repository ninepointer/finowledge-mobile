class ActiveCitiesResponse {
  String? message;
  String? status;
  List<ActiveCitiesList>? data;

  ActiveCitiesResponse({this.message, this.status, this.data});

  ActiveCitiesResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ActiveCitiesList>[];
      json['data'].forEach((v) {
        data!.add(new ActiveCitiesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveCitiesList {
  String? sId;
  String? name;
  int? tier;
  String? state;
  String? status;
  String? createdOn;
  String? lastModifiedOn;
  String? createdBy;
  String? lastModifiedBy;
  int? iV;
  int? code;

  ActiveCitiesList(
      {this.sId,
      this.name,
      this.tier,
      this.state,
      this.status,
      this.createdOn,
      this.lastModifiedOn,
      this.createdBy,
      this.lastModifiedBy,
      this.iV,
      this.code});

  ActiveCitiesList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    tier = json['tier'];
    state = json['state'];
    status = json['status'];
    createdOn = json['createdOn'];
    lastModifiedOn = json['lastModifiedOn'];
    createdBy = json['createdBy'];
    lastModifiedBy = json['lastModifiedBy'];
    iV = json['__v'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['tier'] = this.tier;
    data['state'] = this.state;
    data['status'] = this.status;
    data['createdOn'] = this.createdOn;
    data['lastModifiedOn'] = this.lastModifiedOn;
    data['createdBy'] = this.createdBy;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['__v'] = this.iV;
    data['code'] = this.code;
    return data;
  }
}
