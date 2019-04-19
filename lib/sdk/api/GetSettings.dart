import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';


Future<GetSettingsModel> GetSettingsAPI(
    Map<String, String> parameters, Map<String, String> body) async {
  try {
    return GetSettingsModel.fromJson(await request_POST_header(
        parameters: parameters, body: body, url: BASE_URL));
  } catch (e) {
    print(e);
  }
  return null;
}



class GetSettingsModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  Response response;

  GetSettingsModel(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.response});

  GetSettingsModel.fromJson(String json1) {
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
  String id;
  String companyLogo;
  String companyName;

  Response({this.id, this.companyLogo, this.companyName});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyLogo = json['company_logo'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_logo'] = this.companyLogo;
    data['company_name'] = this.companyName;
    return data;
  }
}