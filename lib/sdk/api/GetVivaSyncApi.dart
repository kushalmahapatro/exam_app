import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';


Future<VivaSyncApiModel> GetVivaSyncApiModel(
    Map<String, String> parameters, Map<String, String> body) async {
  try {
    return VivaSyncApiModel.fromJson(await request_POST_header(
        parameters: parameters, body: body, url: BASE_URL));
  } catch (e) {
    print(e);
  }
  return null;
}


class VivaSyncApiModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  String response;

  VivaSyncApiModel(
      {this.responseCode,
        this.responseStatus,
        this.responseMessage,
        this.response});

  VivaSyncApiModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    responseCode = json['ResponseCode'];
    responseStatus = json['ResponseStatus'];
    responseMessage = json['ResponseMessage'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseStatus'] = this.responseStatus;
    data['ResponseMessage'] = this.responseMessage;
    data['Response'] = this.response;
    return data;
  }
}