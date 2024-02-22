class QuizUserInilizationResponse {
  String? status;
  QuizUserInilizationData? data;

  QuizUserInilizationResponse({this.status, this.data});

  QuizUserInilizationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new QuizUserInilizationData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class QuizUserInilizationData {
  String? student;
  String? initiatedOn;
  String? quiz;
  String? createdBy;
  String? lastmodifiedBy;
  String? sId;
  String? createdOn;
  String? lastmodifiedOn;
  int? iV;

  QuizUserInilizationData(
      {this.student,
      this.initiatedOn,
      this.quiz,
      this.createdBy,
      this.lastmodifiedBy,
      this.sId,
      this.createdOn,
      this.lastmodifiedOn,
      this.iV});

  QuizUserInilizationData.fromJson(Map<String, dynamic> json) {
    student = json['student'];
    initiatedOn = json['initiatedOn'];
    quiz = json['quiz'];
    createdBy = json['createdBy'];
    lastmodifiedBy = json['lastmodifiedBy'];
    sId = json['_id'];
    createdOn = json['createdOn'];
    lastmodifiedOn = json['lastmodifiedOn'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student'] = this.student;
    data['initiatedOn'] = this.initiatedOn;
    data['quiz'] = this.quiz;
    data['createdBy'] = this.createdBy;
    data['lastmodifiedBy'] = this.lastmodifiedBy;
    data['_id'] = this.sId;
    data['createdOn'] = this.createdOn;
    data['lastmodifiedOn'] = this.lastmodifiedOn;
    data['__v'] = this.iV;
    return data;
  }
}
