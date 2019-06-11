import 'package:exam_app/model/VivaStepjson.dart';
class VivaQuestionJson {
  String question_id="";
  double marks;
  List<Vivastepjson> vivaQuestions;
  VivaQuestionJson(this.vivaQuestions);

  VivaQuestionJson.fromJson(Map<String, dynamic> json) {
    question_id = json['question_id'];
    marks = json['marks'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.question_id;
    data['marks'] = this.marks;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }

}
class VivaQuestions {
  String qstn_answer="";
  double obtained_marks;
  VivaQuestions.fromJson(Map<String, dynamic> json) {
    qstn_answer = json['qstn_answer'];
    obtained_marks = json['obtained_marks'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qstn_answer'] = this.qstn_answer;
    data['obtained_marks'] = this.obtained_marks;
    return data;
  }
}