class SchoolUserGradeAndSectionResponse {
  String? status;
  List<SchoolUserGradeAndSectionList>? data;

  SchoolUserGradeAndSectionResponse({this.status, this.data});

  SchoolUserGradeAndSectionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SchoolUserGradeAndSectionList>[];
      json['data'].forEach((v) {
        data!.add(new SchoolUserGradeAndSectionList.fromJson(v));
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

class SchoolUserGradeAndSectionList {
  Grade? grade;
  List<String>? sections;
  String? sId;

  SchoolUserGradeAndSectionList({this.grade, this.sections, this.sId});

  SchoolUserGradeAndSectionList.fromJson(Map<String, dynamic> json) {
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    sections = json['sections'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    data['sections'] = this.sections;
    data['_id'] = this.sId;
    return data;
  }
}

class Grade {
  String? sId;
  String? grade;

  Grade({this.sId, this.grade});

  Grade.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['grade'] = this.grade;
    return data;
  }
}
