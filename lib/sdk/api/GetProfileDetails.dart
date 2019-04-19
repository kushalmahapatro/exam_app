import 'package:exam_app/sdk/ApiUtils.dart';

Future<ProfileDetailsModel> getProfileDetailsApi(Map<String, String> parameters) async {
  try {
    return ProfileDetailsModel.fromJSON(await request_POST_header(parameters: parameters, url: getProfileDetailsUrl()));
  } catch (e) {
    print(e);
  }
  return null;
}

class ProfileDetailsModel {
  final int statusCode;
  final String id;
  final String email;
  final String displayName;
  final String phone;
  final String studioId;
  final String profileImage;
  final String isSubscribed;
  final String customLanguages;
  final String customLastName;
  final String customCountry;

  ProfileDetailsModel(this.statusCode, this.id, this.email, this.displayName, this.phone, this.studioId,
      this.profileImage, this.isSubscribed, this.customLanguages, this.customLastName,
      this.customCountry);

  ProfileDetailsModel.fromJSON(String json)
      : assert(json != null),
        statusCode = (jsonDecode(json) as Map)["code"] as int ?? 0,
        id = (jsonDecode(json) as Map)["id"] as String ?? "",
        email = (jsonDecode(json) as Map)["email"] as String ?? "",
        displayName = (jsonDecode(json) as Map)["display_name"] as String ?? "",
        phone = (jsonDecode(json) as Map)["mobile_number"] as String ?? "",
        studioId = (jsonDecode(json) as Map)["studio_id"] as String ?? "",
        profileImage = (jsonDecode(json) as Map)["profile_image"] as String ?? "",
        isSubscribed = (jsonDecode(json) as Map)["isSubscribed"] as String ?? "",
        customLanguages = (jsonDecode(json) as Map)["custom_languages"] as String ?? "",
        customLastName = (jsonDecode(json) as Map)["custom_last_name"] as String ?? "",
        customCountry = (jsonDecode(json) as Map)["custom_country"] as String ?? "";
}