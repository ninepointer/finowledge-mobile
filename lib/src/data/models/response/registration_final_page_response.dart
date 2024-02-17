class RegistrationFinalResponse {
  String? status;
  // List<Null>? data;
  String? message;

  RegistrationFinalResponse({this.status, this.message});

  RegistrationFinalResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    // if (json['data'] != null) {
    //   data = <Null>[];
    //   json['data'].forEach((v) {
    //     data!.add(new Null.fromJson(v));
    //   });
    // }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    data['message'] = this.message;
    return data;
  }
}
