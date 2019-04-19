import 'package:exam_app/sdk/ApiConstants.dart';
import 'package:exam_app/sdk/ApiUtils.dart';

Future<LoginModel> loginUserApi(Map<String, String> parameters) async {
  try {
    return LoginModel.fromJSON(
        await request_POST_header(parameters: parameters, url: login()));
  } catch (e) {
    print(e);
  }
  return null;
}

class LoginModel {
  String id;
  String email;
  String display_name;
  String nick_name;
  String studio_id;
  String profile_image;
  int isSubscribed = 0;
  int code;
  String status;
  String msg;
  String freeUser = "0";
  String login_history_id;

  LoginModel(
      this.id,
      this.email,
      this.display_name,
      this.nick_name,
      this.studio_id,
      this.profile_image,
      this.isSubscribed,
      this.code,
      this.status,
      this.msg,
      this.freeUser,
      this.login_history_id);

  LoginModel.fromJSON(String json)
      : assert(json != null),
        code = (jsonDecode(json) as Map)["code"] as int ?? 0,
        status = (jsonDecode(json) as Map)["status"] as String ?? 0,
        freeUser = (jsonDecode(json) as Map)["isFree"] as String ?? "",
        email = (jsonDecode(json) as Map)["email"] as String ?? "",
        display_name =
            (jsonDecode(json) as Map)["display_name"] as String ?? "",
        profile_image =
            (jsonDecode(json) as Map)["profile_image"] as String ?? "",
        isSubscribed =
            (jsonDecode(json) as Map)["isSubscribed"] as int ?? 0,
        nick_name = (jsonDecode(json) as Map)["nick_name"] as String ?? "",
        studio_id = (jsonDecode(json) as Map)["studio_id"] as String ?? "",
        msg = (jsonDecode(json) as Map)["msg"] as String ?? "",
        login_history_id =
            (jsonDecode(json) as Map)["login_history_id"] as String ?? "",
        id = (jsonDecode(json) as Map)["id"] as String ?? "";
}
