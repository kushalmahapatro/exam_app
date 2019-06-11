import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';


Future<GetAddDeviceModel> GetAddDeviceAPI(
    Map<String, String> parameters, Map<String, String> body) async {
  try {
    return GetAddDeviceModel.fromJson(await request_POST_header(
        parameters: parameters, body: body, url: BASE_URL));
  } catch (e) {
    print(e);
  }
  return null;
}


class GetAddDeviceModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  Response response;

  GetAddDeviceModel(
      {this.responseCode,
        this.responseStatus,
        this.responseMessage,
        this.response});

  GetAddDeviceModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    responseCode = json['ResponseCode'];
    responseStatus = json['ResponseStatus'];
    responseMessage = json['ResponseMessage'];
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
}

class Response {
  String recordId;

  Response({this.recordId});

  Response.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['record_id'] = this.recordId;
    return data;
  }
}