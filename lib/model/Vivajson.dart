class QuestionJson {
  String qstn_id="";
  String qstn_answer="";
  String reviewed;

  QuestionJson({this.qstn_id, this.qstn_answer});

  QuestionJson.fromJson(Map<String, dynamic> json) {
    qstn_id = json['qstn_id'];
    qstn_answer = json['qstn_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.qstn_id;
    data['answer'] = this.qstn_answer;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}