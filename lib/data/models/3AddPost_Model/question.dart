// import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  List? Question;
  List<Map<String, List>>? Answer;
  List? correctAnswer;

  QuestionModel({
    this.Question,
    this.Answer,
    this.correctAnswer,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    Question = json['Question'];
    Answer = json['Answer'];
    correctAnswer = json['correctAnswer'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Question': Question,
      'Answer': Answer,
      'correctAnswer': correctAnswer,
    };
  }
}
