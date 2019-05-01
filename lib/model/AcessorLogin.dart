//import 'dart:convert';
import 'EventData.dart';
export 'EventData.dart';

class AssessorLoginModel{

  static AssessorLoginModel _instance;

  int responseCode;
  bool responseStatus;
  String responseMessage;
  EventData eventData;


  AssessorLoginModel({
    this.responseCode = 0,
    this.responseStatus = false,
    this.responseMessage = "",
    this.eventData
  });

  AssessorLoginModel._fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'] ?? "";
    responseStatus = json['ResponseStatus'] ?? "";
    responseMessage = json['ResponseMessage'] ?? "";
    if(json!=null && json['Response']!=null && json['Response'] is Map && (json['Response'] as Map)['event_data']!=null) {
      eventData = EventData.fromJson((json['Response'] as Map)['event_data']);
    }
    else {
      eventData = EventData.fromJson(Map<String, dynamic>());
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseStatus'] = this.responseStatus;
    data['ResponseMessage'] = this.responseMessage;
    if (this.eventData != null) {
      data['EventData'] = this.eventData.toJson();
    }
    return data;
  }

  static AssessorLoginModel getInstance(Map json) {
    _instance ??= AssessorLoginModel._fromJson(json);
    return _instance;
  }

  static void clear() {
    _instance = null;
  }
}