// class MyActiveOlympiadResponse {
//   String? status;
//   List<MyActiveOlympiadList>? data;

//   MyActiveOlympiadResponse({this.status, this.data});

//   MyActiveOlympiadResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <MyActiveOlympiadList>[];
//       json['data'].forEach((v) {
//         data!.add(new MyActiveOlympiadList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class MyActiveOlympiadList {
//   String? sId;
//   String? title;
//   String? startDateTime;
//   String? registrationOpenDateTime;
//   int? durationInSeconds;
//   String? rewardType;
//   String? image;
//   int? maxParticipant;
//   String? grade;
//   String? status;
//   int? registrationsCount;

//   MyActiveOlympiadList(
//       {this.sId,
//       this.title,
//       this.startDateTime,
//       this.registrationOpenDateTime,
//       this.durationInSeconds,
//       this.rewardType,
//       this.image,
//       this.maxParticipant,
//       this.grade,
//       this.status,
//       this.registrationsCount});

//   MyActiveOlympiadList.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     startDateTime = json['startDateTime'];
//     registrationOpenDateTime = json['registrationOpenDateTime'];
//     durationInSeconds = json['durationInSeconds'];
//     rewardType = json['rewardType'];
//     image = json['image'];
//     maxParticipant = json['maxParticipant'];
//     grade = json['grade'];
//     status = json['status'];
//     registrationsCount = json['registrationsCount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['title'] = this.title;
//     data['startDateTime'] = this.startDateTime;
//     data['registrationOpenDateTime'] = this.registrationOpenDateTime;
//     data['durationInSeconds'] = this.durationInSeconds;
//     data['rewardType'] = this.rewardType;
//     data['image'] = this.image;
//     data['maxParticipant'] = this.maxParticipant;
//     data['grade'] = this.grade;
//     data['status'] = this.status;
//     data['registrationsCount'] = this.registrationsCount;
//     return data;
//   }
// }
class MyActiveOlympiadResponse {
  String? status;
  List<MyActiveOlympiadList>? data;

  MyActiveOlympiadResponse({this.status, this.data});

  MyActiveOlympiadResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MyActiveOlympiadList>[];
      json['data'].forEach((v) {
        data!.add(new MyActiveOlympiadList.fromJson(v));
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

class MyActiveOlympiadList {
  String? sId;
  String? title;
  String? startDateTime;
  String? registrationOpenDateTime;
  int? durationInSeconds;
  String? rewardType;
  String? image;
  int? maxParticipant;
  String? grade;
  String? status;
  int? entryFee;
  int? noOfSlots;
  String? registrationCloseDateTime;
  int? registrationsCount;

  MyActiveOlympiadList(
      {this.sId,
      this.title,
      this.startDateTime,
      this.registrationOpenDateTime,
      this.durationInSeconds,
      this.rewardType,
      this.image,
      this.maxParticipant,
      this.grade,
      this.status,
      this.entryFee,
      this.noOfSlots,
      this.registrationCloseDateTime,
      this.registrationsCount});

  MyActiveOlympiadList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    startDateTime = json['startDateTime'];
    registrationOpenDateTime = json['registrationOpenDateTime'];
    durationInSeconds = json['durationInSeconds'];
    rewardType = json['rewardType'];
    image = json['image'];
    maxParticipant = json['maxParticipant'];
    grade = json['grade'];
    status = json['status'];
    entryFee = json['entryFee'] != null ? json['entryFee'] : 0;
    noOfSlots = json['noOfSlots'];
    registrationCloseDateTime = json['registrationCloseDateTime'];
    registrationsCount = json['registrationsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['startDateTime'] = this.startDateTime;
    data['registrationOpenDateTime'] = this.registrationOpenDateTime;
    data['durationInSeconds'] = this.durationInSeconds;
    data['rewardType'] = this.rewardType;
    data['image'] = this.image;
    data['maxParticipant'] = this.maxParticipant;
    data['grade'] = this.grade;
    data['status'] = this.status;
    data['entryFee'] = this.entryFee;
    data['noOfSlots'] = this.noOfSlots;
    data['registrationCloseDateTime'] = this.registrationCloseDateTime;
    data['registrationsCount'] = this.registrationsCount;
    return data;
  }
}
