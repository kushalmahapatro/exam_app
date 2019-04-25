import 'dart:convert';
import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';

Future<GetAssessorLoginModel> getAssessorLoginAPI(
    Map<String, String> params, Map<String, String> body) async {
  try {
    return GetAssessorLoginModel.fromJson(await request_POST_header(
        parameters: params, body: body, url: BASE_URL));
  } catch (e) {
    print(e);
  }
  return null;
}

class GetAssessorLoginModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  String response;

  GetAssessorLoginModel(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.response});

  GetAssessorLoginModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    responseCode = json['ResponseCode'];
    responseStatus = json['ResponseStatus'];
    responseMessage = json['ResponseMessage'];
    if (json['Response'] != null) {
      response = json['Response'].toString();
    }
  }
}
