
class Step {
  String id;
  String vivaQuestionId;
  String step;
  String language;

  Step({this.id, this.vivaQuestionId, this.step, this.language});

  Step.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    vivaQuestionId = json['viva_question_id'] ?? "";
    step = json['step'] ?? "";
    language = json['language'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['viva_question_id'] = this.vivaQuestionId;
    data['step'] = this.step;
    data['language'] = this.language;
    return data;
  }
}