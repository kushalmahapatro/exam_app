import 'dart:convert';
import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';
import 'package:exam_app/model/AcessorLogin.dart';
export 'package:exam_app/model/AcessorLogin.dart';

Future<AssessorLoginModel> getAssessorLoginAPI(
    Map<String, String> params, Map<String, String> body) async {
  try {
    AssessorLoginModel.clear();
    return AssessorLoginModel.getInstance((jsonDecode(await request_POST_header(
        parameters: params, body: body, url: BASE_URL)) as Map<String, dynamic>));
  } catch (e) {
    print(e);
  }
  return null;
}

/*class GetAssessorLoginModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  Response response;

  GetAssessorLoginModel(
      {this.responseCode,
        this.responseStatus,
        this.responseMessage,
        this.response});

  GetAssessorLoginModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);

    responseCode = json['ResponseCode'] != null
                   ? json['ResponseCode']:0;
    responseStatus = json['ResponseStatus'] != null
                     ? json['ResponseStatus']:null;
    responseMessage = json['ResponseMessage'] != null
                      ? json['ResponseMessage']:null;
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseStatus'] = this.responseStatus;
    data['ResponseMessage'] = this.responseMessage;
    if (this.response != null) {
      data['Response'] = this.response.toJson();
    }
    return data;
  }
}*/
