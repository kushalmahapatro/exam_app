import 'package:exam_app/utils/Constants.dart';

const String _BASE_URL = BASE_URL;

const String _IP_ADDRESS_ENDPOINT =  "https://api.ipify.org/?format=json";
const String _CHECK_GEO_BLOCK_ENDPONT = "checkGeoBlock";
const String _GET_PLAN_LIST_ENDPONT = "getStudioPlanLists";
const String _GET_LANGUAGE_LIST_ENDPOINT = "getLanguageList";
const String _IS_REGISTRATION_ENABLED_ENDPOINT = "isRegistrationEnabled";
const String _TEXT_TRANSLATION_ENDPOINT = "textTranslation";
const String _GET_PROFILE_DETAILS_ENDPOINT = "getProfileDetails";
const String _GET_APP_HOME_FEATURE = "GetAppHomeFeature";
const String _GET_CONTENT_LIST = "getContentList";
const String _GET_VIDEO_DETAILS = "getVideoDetails";
const String _GET_APP_MENU = "getAppMenu";
const String _LOGIN = "login";

String ipAddressUrl() {
  return _IP_ADDRESS_ENDPOINT;
}

String getPlanListUrl() {
  return _BASE_URL + _GET_PLAN_LIST_ENDPONT;
}

String checkGeoBlockUrl() {
  return _BASE_URL + _CHECK_GEO_BLOCK_ENDPONT;
}

String getLanguageListUrl() {
  return _BASE_URL + _GET_LANGUAGE_LIST_ENDPOINT;
}

String isRegistrationEnabledUrl() {
  return _BASE_URL + _IS_REGISTRATION_ENABLED_ENDPOINT;
}

String textTranslationUrl() {
  return _BASE_URL + _TEXT_TRANSLATION_ENDPOINT;
}

String getProfileDetailsUrl() {
  return _BASE_URL + _GET_PROFILE_DETAILS_ENDPOINT;
}

String getAppHomeFeature() {
  return _BASE_URL + _GET_APP_HOME_FEATURE;
}

String getAppMenu() {
  return _BASE_URL + _GET_APP_MENU;
}

String getContentList() {
  return _BASE_URL + _GET_CONTENT_LIST;
}
String getVideoDetails() {
  return _BASE_URL + _GET_VIDEO_DETAILS;
}

String login() {
  return _BASE_URL + _LOGIN;
}