import 'package:exam_app/sdk/ApiUtils.dart';
import 'package:exam_app/utils/Constants.dart';


Future<SyncApiModel> GetSyncApiModel(
    Map<String, String> parameters, Map<String, String> body) async {
  try {
    return SyncApiModel.fromJson(await request_POST_header(
        parameters: parameters, body: body, url: BASE_URL));
  } catch (e) {
    print(e);
  }
  return null;
}


class SyncApiModel {
  int responseCode;
  bool responseStatus;
  String responseMessage;
  String response;

  SyncApiModel(
      {this.responseCode,
        this.responseStatus,
        this.responseMessage,
        this.response});

  SyncApiModel.fromJson(String json1) {
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