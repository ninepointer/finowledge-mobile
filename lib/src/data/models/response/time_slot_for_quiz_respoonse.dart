class TimeSlotForQuizRegistrationResponse {
  String? status;
  List<TimeSlotForQuizList>? data;

  TimeSlotForQuizRegistrationResponse({this.status, this.data});

  TimeSlotForQuizRegistrationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TimeSlotForQuizList>[];
      json['data'].forEach((v) {
        data!.add(new TimeSlotForQuizList.fromJson(v));
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

class TimeSlotForQuizList {
  String? slotTime;
  String? slotId;
  int? spotLeft;

  TimeSlotForQuizList({this.slotTime, this.slotId, this.spotLeft});

  TimeSlotForQuizList.fromJson(Map<String, dynamic> json) {
    slotTime = json['slotTime'];
    slotId = json['slotId'];
    spotLeft = json['spotLeft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slotTime'] = this.slotTime;
    data['slotId'] = this.slotId;
    data['spotLeft'] = this.spotLeft;
    return data;
  }
}
