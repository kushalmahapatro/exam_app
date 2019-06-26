class VivaJson{
  String question_id="";
  double marks=0.0;
  double obtained_marks=0.0;

  VivaJson({this.question_id, this.marks,this.obtained_marks});

  VivaJson.fromJson(Map<String, dynamic> json) {
    question_id = json['question_id'];
    marks = json['marks'];
    obtained_marks = json['obtained_marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.question_id;
    data['marks'] = this.marks;
    data['obtained_marks'] = this.obtained_marks;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}