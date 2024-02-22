class QuizPracticeQuestionAndAnswerResponse {
  String? status;
  QuizPracticeQuestionAndAnswerData? data;

  QuizPracticeQuestionAndAnswerResponse({this.status, this.data});

  QuizPracticeQuestionAndAnswerResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new QuizPracticeQuestionAndAnswerData.fromJson(json['data'])
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

class QuizPracticeQuestionAndAnswerData {
  String? sId;
  String? quiz;
  List<QuizQuestions>? questions;
  List<QuizResponses>? responses;

  QuizPracticeQuestionAndAnswerData(
      {this.sId, this.quiz, this.questions, this.responses});

  QuizPracticeQuestionAndAnswerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quiz = json['quiz'];
    if (json['questions'] != null) {
      questions = <QuizQuestions>[];
      json['questions'].forEach((v) {
        questions!.add(new QuizQuestions.fromJson(v));
      });
    }
    if (json['responses'] != null) {
      responses = <QuizResponses>[];
      json['responses'].forEach((v) {
        responses!.add(new QuizResponses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['quiz'] = this.quiz;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    if (this.responses != null) {
      data['responses'] = this.responses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizQuestions {
  String? sId;
  String? title;
  String? type;
  num? score;
  String? difficultyLevel;
  String? topic;
  List<QuizOptions>? options;
  String? image;

  QuizQuestions(
      {this.sId,
      this.title,
      this.type,
      this.score,
      this.difficultyLevel,
      this.topic,
      this.options,
      this.image});

  QuizQuestions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    type = json['type'];
    score = json['score'];
    difficultyLevel = json['difficultyLevel'];
    topic = json['topic'];
    if (json['options'] != null) {
      options = <QuizOptions>[];
      json['options'].forEach((v) {
        options!.add(new QuizOptions.fromJson(v));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['score'] = this.score;
    data['difficultyLevel'] = this.difficultyLevel;
    data['topic'] = this.topic;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    return data;
  }
}

class QuizOptions {
  String? title;
  String? sId;
  String? image;

  QuizOptions({this.title, this.sId, this.image});

  QuizOptions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sId = json['_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['_id'] = this.sId;
    data['image'] = this.image;
    return data;
  }
}

class QuizResponses {
  String? questionId;
  List<String>? responses;
  String? sId;

  QuizResponses({this.questionId, this.responses, this.sId});

  QuizResponses.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    responses = json['responses'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['responses'] = this.responses;
    data['_id'] = this.sId;
    return data;
  }
}
