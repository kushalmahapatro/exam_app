class CalculateTimejson{
  String start_timestamp="";
  String end_timestamp="";
  CalculateTimejson(this.start_timestamp,this.end_timestamp);
  CalculateTimejson.fromJson(Map<String, dynamic> json) {
    start_timestamp = json['start_timestamp'];
    end_timestamp = json['end_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_timestamp'] = this.start_timestamp;
    data['end_timestamp'] = this.end_timestamp;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}