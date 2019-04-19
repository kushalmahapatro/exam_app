import 'package:exam_app/sdk/ApiUtils.dart';

Future<IsRegistrationEnabledModel> IsRegistrationEnabledApi(Map<String, String> parameters) async {
  try {
    return IsRegistrationEnabledModel.fromJSON(await request_POST_header(parameters: parameters, url: isRegistrationEnabledUrl()));
  }
  catch(e) {
    print(e);
  }
  return null;
}

class IsRegistrationEnabledModel {
  final int statusCode;
  final int isLogin;
  final int isMyLibrary;
  final int isRestrictDevice;
  final int isOffline;
  final int isStreamingRestriction;
  final int isFavourite;
  final int isRating;
  final int signupStep;
  final int chromcast;

  IsRegistrationEnabledModel(this.statusCode, this.isLogin, this.isMyLibrary,
      this.isRestrictDevice, this.isOffline, this.isStreamingRestriction,
      this.isFavourite, this.signupStep, this.chromcast, this.isRating);


  IsRegistrationEnabledModel.fromJSON(String json)
      : assert(json != null),
        statusCode = (jsonDecode(json) as Map)["code"] as int ?? 0,
        isLogin = (jsonDecode(json) as Map)["is_login"] as int ?? 0,
        isMyLibrary = (jsonDecode(json) as Map)["isMylibrary"] as int ?? 0,
        isRestrictDevice = (jsonDecode(json) as Map)["isRestrictDevice"] as int ?? 0,
        isOffline = (jsonDecode(json) as Map)["is_offline"] as int ?? 0,
        isStreamingRestriction = (jsonDecode(json) as Map)["is_streaming_restriction"] as int ?? 0,
        isFavourite = (jsonDecode(json) as Map)["has_favourite"] as int ?? 0,
        signupStep = (jsonDecode(json) as Map)["signup_step"] as int ?? 0,
        chromcast = (jsonDecode(json) as Map)["chromecast"] as int ?? 0,
        isRating = (jsonDecode(json) as Map)["isRating"] as int ?? 0;
}