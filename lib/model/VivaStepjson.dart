class Vivastepjson {
  String qstn_answer="";
  double obtained_marks;

  Vivastepjson(this.qstn_answer,this.obtained_marks);

  Vivastepjson.fromJson(Map<String, dynamic> json) {
    qstn_answer = json['qstn_answer'];
    obtained_marks = json['obtained_marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qstn_answer'] = this.qstn_answer;
    data['obtained_marks'] = this.obtained_marks;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}