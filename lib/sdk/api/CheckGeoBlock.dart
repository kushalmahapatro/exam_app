import 'package:exam_app/sdk/ApiUtils.dart';

Future<CheckGeoBlockModel> checkGeoBlockApi(
    Map<String, String> parameters) async {
  try {
    return CheckGeoBlockModel.fromJSON(await request_POST_header(
        parameters: parameters, url: checkGeoBlockUrl()));
  } catch (e) {
    print(e);
  }
  return null;
}

class CheckGeoBlockModel {
  final int statusCode;
  final String country;

  CheckGeoBlockModel(this.statusCode, this.country);

  CheckGeoBlockModel.fromJSON(String json)
      : assert(json != null),
        statusCode = (jsonDecode(json) as Map)["code"] as int ?? 0,
        country = (jsonDecode(json) as Map)["country"] as String ?? "";
}
